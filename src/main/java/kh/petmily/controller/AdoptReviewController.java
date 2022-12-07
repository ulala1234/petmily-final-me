/*입양 후기 게시판 컨트롤러 클래스로
내가 구현한 기능은
가 있다.*/

package kh.petmily.controller;

import kh.petmily.domain.adopt_review.form.AdoptReviewForm;
import kh.petmily.domain.adopt_review.form.AdoptReviewModifyForm;
import kh.petmily.domain.adopt_review.form.AdoptReviewWriteForm;
import kh.petmily.domain.adopt_review.form.BoardPage;
import kh.petmily.domain.member.Member;
import kh.petmily.service.AdoptReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.MalformedURLException;

@Controller
@RequestMapping("/adopt_review")
@RequiredArgsConstructor
@Slf4j
public class AdoptReviewController {

    private final AdoptReviewService adoptReviewService;

    @ResponseBody
    @GetMapping("/upload")
    public ResponseEntity<Resource> list(String filename, HttpServletRequest request) {

        String fullPath = request.getSession().getServletContext().getRealPath("/");
        fullPath = fullPath + "resources/upload/";
        fullPath = fullPath + filename;

        log.info("fullPath = {} ", fullPath);

        try {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(new UrlResource("file:" + fullPath));
        } catch (MalformedURLException e) {
            log.info("fullPath = {} ", fullPath);

            throw new RuntimeException(e);
        }
    }

    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "1") Integer pbNumber,
                       @RequestParam(required = false) String kindOfBoard,
                       @RequestParam(required = false) String searchType,
                       @RequestParam(required = false) String keyword,
                       HttpServletRequest request,
                       Model model) {
        // by 은지, ======= 조건부 검색 기능 추가 =======
        HttpSession session = request.getSession();

        // 검색 유형과 검색어 null 로 초기화
        initCondition(kindOfBoard, searchType, keyword, session);

        // 검색 유형과 검색어가 있으면 세션 생성
        saveCondition(searchType, keyword, session);

        searchType = (String) session.getAttribute("searchType");
        keyword = (String) session.getAttribute("keyword");

        BoardPage boardPage = adoptReviewService.getAdoptReviewPage(pbNumber, kindOfBoard, searchType, keyword);
        model.addAttribute("boardList", boardPage);
        model.addAttribute("kindOfBoard", kindOfBoard);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);

        log.info("kindOfBoard = {}", kindOfBoard);
        log.info("searchType = {}", searchType);
        log.info("keyword = {}", keyword);

        return "/adopt_review/listAdoptReview";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("bNumber") int bNumber, Model model) {
        // by 은지, 221004 수정, 조회수 바로 오르게 updateViewCount 메소드 컨트롤러 -> 서비스로 이동
        AdoptReviewForm detailForm = adoptReviewService.getAdoptReview(bNumber);

        model.addAttribute("detailForm", detailForm);

        return "/adopt_review/detailFormAdoptReview";
    }

    @GetMapping("/auth/write")
    public String writeForm() {
        return "/adopt_review/writeAdoptReviewForm";
    }

    @PostMapping("/auth/write")
    public String write(@ModelAttribute AdoptReviewWriteForm adoptReviewWriteForm, HttpServletRequest request) {
        String fullPath = request.getSession().getServletContext().getRealPath("/");
        fullPath = fullPath + "resources/upload/";

        if (adoptReviewWriteForm.getmNumber() == 0) {
            Member member = getAuthMember(request);
            int mNumber = member.getMNumber();

            adoptReviewWriteForm.setmNumber(mNumber);
        }

        String filename = "";

        if (!adoptReviewWriteForm.getImgPath().isEmpty()) {

            try {
                log.info("ImgPath = {}, fullPath = {}", adoptReviewWriteForm.getImgPath(), fullPath);

                filename = adoptReviewService.storeFile(adoptReviewWriteForm.getImgPath(), fullPath);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            adoptReviewWriteForm.setFullPath(filename);
        } else {
            adoptReviewWriteForm.setFullPath("");
        }

        log.info("adoptReviewWriteForm = {}", adoptReviewWriteForm);

        adoptReviewService.write(adoptReviewWriteForm);

        return "/adopt_review/writeAdoptReviewSuccess";
    }

    @GetMapping("/auth/modify")
    public String modifyForm(@RequestParam("bNumber") int bNumber, HttpServletRequest request, Model model) {
        AdoptReviewModifyForm modReq = adoptReviewService.getAdoptReviewModify(bNumber);
        Member authUser = getAuthMember(request);

        int mNumber = authUser.getMNumber();
        modReq.setMNumber(mNumber);

        log.info("modReq={}", modReq);

        model.addAttribute("modReq", modReq);

        return "/adopt_review/modifyAdoptReviewForm";
    }

    @PostMapping("/auth/modify")
    public String modify(@RequestParam("bNumber") int bNumber, @RequestParam("kindOfBoard") String kindOfBoard, @ModelAttribute AdoptReviewModifyForm modReq, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        String fullPath = request.getSession().getServletContext().getRealPath("/");
        fullPath = fullPath + "resources/upload/";

        Member authUser = getAuthMember(request);

        int mNumber = authUser.getMNumber();
        modReq.setMNumber(mNumber);
        modReq.setBNumber(bNumber);

        log.info("BoardModifyForm = {}", modReq);
        String filename = null;

        try {
            filename = adoptReviewService.storeFile(modReq.getImgPath(), fullPath);
            modReq.setFullPath(filename);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        adoptReviewService.modify(modReq);
        model.addAttribute("modReq", modReq);
        redirectAttributes.addAttribute("bNumber", bNumber);
        redirectAttributes.addAttribute("kindOfBoard", kindOfBoard);

        return "redirect:/adopt_review/detail?kindOfBoard={kindOfBoard}&bNumber={bNumber}";
    }

    @GetMapping("/auth/delete")
    public String delete(@RequestParam("bNumber") int bNumber) {
        adoptReviewService.delete(bNumber);

        return "/adopt_review/deleteSuccess";
    }

    // by 은지, ======= 검색 세션 상태 유지할 메소드 =======
    private void saveCondition(String searchType, String keyword, HttpSession session) {
        // by 은지, 221206 삭제, kindOfBoard 는 메뉴 탭 선택할 때 지정되므로 세션으로 유지할 필요 없어서 코드 삭제
        if (searchType != null) {
            session.setAttribute("searchType", searchType);
        }

        if (keyword != null) {
            if (!keyword.equals("")) {
                session.setAttribute("keyword", keyword);
            } else {
                // by 은지, 221205 수정, allKeyword 를 빈칸으로 두어도 전체 검색이 되는 동적 쿼리이고
                // view 에도 allKeyword 가 value 값인 것보다 빈칸인 것이 나아서 수정
                session.setAttribute("keyword", "");
            }
        }
    }

    // by 은지, ======= 입양후기 게시판에 들어올 때 검색 유형과 키워드 값이 없으면 세션 제거하는 메소드 =======
    // 세션 제거를 안하면 입양후기 게시판을 나갔다가 다시 들어와도 세션엔 전에 저장된 값이 남아있게 됨
    private void initCondition(String kindOfBoard, String searchType, String keyword, HttpSession session) {
        if (kindOfBoard != null && searchType == null && keyword == null) {
            // by 은지, 221206 삭제, kindOfBoard 는 세션이 필요 없으니 세션 삭제도 필요 없어서 지움
            session.removeAttribute("searchType");
            session.removeAttribute("keyword");
        }
    }

    private Member getAuthMember(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("authUser");

        return member;
    }
}