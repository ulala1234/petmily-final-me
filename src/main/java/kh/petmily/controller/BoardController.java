package kh.petmily.controller;

import kh.petmily.domain.board.form.BoardModifyForm;
import kh.petmily.domain.board.form.BoardPage;
import kh.petmily.domain.board.form.ReadBoardForm;
import kh.petmily.domain.board.form.WriteBoardForm;
import kh.petmily.domain.member.Member;
import kh.petmily.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/list")
    public String list(@RequestParam String kindOfBoard,
                       @RequestParam(defaultValue = "1") int pbNumber,
                       @RequestParam String sort,
                       Model model) {

        log.info("kindOfBoard = {}", kindOfBoard);
        log.info("pbNumber = {}", pbNumber);
        log.info("sort = {}", sort);

        BoardPage boardPage = boardService.getBoardPage(pbNumber, kindOfBoard, sort);

        model.addAttribute("readBoardForm", boardPage);

        return "/board/boardList";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("bNumber") int bNumber, Model model) {
        // by 은지, 221004 수정, 조회수 바로 오르게 updateViewCount 메소드 컨트롤러 -> 서비스로 이동
        ReadBoardForm detailForm = boardService.getBoard(bNumber);

        model.addAttribute("detailForm", detailForm);

        return "/board/boardDetailForm";
    }

    @GetMapping("/auth/write")
    public String writeForm() {
        return "/board/writeBoardForm";
    }

    @PostMapping("/auth/write")
    public String write(@ModelAttribute WriteBoardForm writeBoardForm, HttpServletRequest request) {
        if (writeBoardForm.getMNumber() == 0) {
            Member member = getAuthMember(request);

            int mNumber = member.getMNumber();
            writeBoardForm.setMNumber(mNumber);
        }

        log.info("WriteBoardForm = {}", writeBoardForm);

        boardService.write(writeBoardForm);

        return "/board/writeBoardSuccess";
    }

    @GetMapping("/auth/modify")
    public String modifyForm(@RequestParam("bNumber") int bNumber, @RequestParam("kindOfBoard") String kindOfBoard, HttpServletRequest request, Model model) {
        BoardModifyForm modReq = boardService.getBoardModify(bNumber);
        Member authUser = getAuthMember(request);

        int mNumber = authUser.getMNumber();
        modReq.setMNumber(mNumber);
        modReq.setBNumber(bNumber);

        log.info("bNumber = {}", bNumber);

        model.addAttribute("modReq", modReq);

        return "/board/modifyForm";
    }

    @PostMapping("/auth/modify")
    public String modify(@RequestParam("bNumber") int bNumber, @RequestParam("kindOfBoard") String kindOfBoard, @ModelAttribute BoardModifyForm modReq, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        Member authUser = getAuthMember(request);

        int mNumber = authUser.getMNumber();
        modReq.setMNumber(mNumber);
        modReq.setBNumber(bNumber);

        log.info("BoardModifyForm = {}", modReq);

        boardService.modify(modReq);
        model.addAttribute("modReq", modReq);
        redirectAttributes.addAttribute("bNumber", bNumber);
        redirectAttributes.addAttribute("kindOfBoard", kindOfBoard);

        return "redirect:/board/detail?kindOfBoard={kindOfBoard}&bNumber={bNumber}";
    }

    @GetMapping("/auth/delete")
    public String delete(@RequestParam("bNumber") int bNumber) {
        boardService.delete(bNumber);

        return "/board/deleteSuccess";
    }

    private Member getAuthMember(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Member member = (Member) session.getAttribute("authUser");
        return member;
    }
}