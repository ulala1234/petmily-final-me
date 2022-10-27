/*회원 컨트롤러 클래스로
회원가입, 로그인, 로그아웃, 회원가입 시 메일 인증, 비밀번호 찾기 시 메일 인증,
마이페이지(회원정보 변경, 회원 탈퇴, 찾아요 매칭 결과, 입양 / 임시보호 신청 내역) 기능이 있다.*/

package kh.petmily.controller;

import kh.petmily.domain.adopt.form.AdoptApplyPageForm;
import kh.petmily.domain.find_board.FindBoard;
import kh.petmily.domain.find_board.form.FindBoardPageForm;
import kh.petmily.domain.look_board.form.LookBoardPageForm;
import kh.petmily.domain.mail.EmailCheck;
import kh.petmily.domain.mail.form.EmailCodeRequest;
import kh.petmily.domain.mail.form.EmailRequest;
import kh.petmily.domain.member.Member;
import kh.petmily.domain.member.form.JoinRequest;
import kh.petmily.domain.member.form.MemberChangeForm;
import kh.petmily.domain.member.form.PwChangeRequest;
import kh.petmily.domain.temp.form.TempApplyPageForm;
import kh.petmily.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;
    private final FindBoardService findBoardService;
    private final LookBoardService lookBoardService;
    private final AdoptTempService adoptTempService;
    private final EmailService emailService;

    @RequestMapping("/")
    public String home() {
        return "/main/index";
    }

    // ======= 회원가입 =======
    @GetMapping("/join")
    public String joinForm() {
        return "/login/joinForm";
    }

    @PostMapping("/join")
    public String join(@ModelAttribute("joinRequest") JoinRequest joinRequest) {
        log.info("넘어온 joinRequest : {}", joinRequest);

        // 패스워드와 패스워드 확인 일치, 불일치 검사
        if (!joinRequest.isPwEqualToConfirm()) {
            return "login/joinForm";
        }

        memberService.join(joinRequest);

        // by 은지, 221024 수정, url login 으로 가지 않는 매핑 문제 해결
        return "/login/joinSuccess";
    }

    // ======= 회원가입 시 메일 인증 =======
    @ResponseBody
    @PostMapping("/join/mailCheck")
    public String mailCheck(@RequestBody EmailRequest emailRequest) throws MessagingException {
        log.info("email : {}", emailRequest);

        // 임시 인증 번호를 생성하여 메일을 보낸 후 임시 인증 번호로 return
        String authCode = emailService.sendEmail(emailRequest.getAddress());
        emailService.registEmailCheck(emailRequest.getAddress(), authCode);

        return authCode;
    }

    @ResponseBody
    @RequestMapping(value = "/join/codeCheck")
    public int CodeCompare(@RequestBody EmailCodeRequest mailAuth) {
        log.info("EmailCodeRequest: {}", mailAuth);
        EmailCheck emailCheck = emailService.makeEmailCheck(mailAuth);

        return emailCheck.getIs_Auth();
    }

    // by 은지, ======= 비밀번호 찾기 시 메일 발송 =======
    @GetMapping("/pwChange")
    public String pwChangeForm() {
        return "/login/pwChangeForm";
    }

    @PostMapping("/pwChange")
    public String pwChange(@RequestParam("email") String email, @RequestParam("id") String id, Model model) throws Exception {
        // by 은지, 이메일과 아이디가 일치하지 않으면 0
        if (memberService.memberCheck(email, id) == 0) {
            model.addAttribute("msg", "이메일과 아이디를 확인해주세요");

            return "/login/pwChangeForm";
        } else {
            memberService.sendEmail(email, id);

            return "/member/pwChangeAuth";
        }
    }

    // by 은지, ======= 비밀번호 찾기 인증 메일이 왔다면 링크 클릭 시 비밀번호 변경 페이지로 =======
    @GetMapping("/member/pwChange")
    public String pwUpdateForm(PwChangeRequest pwChangeRequest, Model model) {
        log.info("pwChangeRequest = {}", pwChangeRequest);

        model.addAttribute("email", pwChangeRequest.getEmail());
        model.addAttribute("id", pwChangeRequest.getId());

        return "/member/pwUpdateForm";
    }

    @PostMapping("/member/pwChange")
    public String pwUpdate(PwChangeRequest pwChangeRequest) {
        log.info("pwChangeRequest = {}", pwChangeRequest);

        memberService.pwChange(pwChangeRequest);

        return "/member/pwUpdateSuccess";
    }

    // ======= 로그인 =======
    @GetMapping("/login")
    public String loginForm() {
        return "/login/loginForm";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam("id") String id,
            @RequestParam("pw") String pw,
            HttpServletRequest request) {

        Member authUser;

        try {
            authUser = memberService.login(id, pw);
        } catch (Exception e) {
            return "/login/loginForm";
        }

        if (authUser == null) {
            return "/login/loginForm";
        }

        // 로그인 한 정보로 세션 세팅
        request.getSession().setAttribute("authUser", authUser);

        if (authUser.getGrade().equals("관리자")) {
            return "redirect:/admin";
        }

        return "redirect:/";
    }

    // ======= 로그아웃 =======
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        // 세션 무효화
        request.getSession().invalidate();

        return "redirect:/";
    }

    // ======= 마이페이지 =======
    @GetMapping("/member/auth/mypage")
    public String mypage(HttpServletRequest request, Model model) {
        Member member = getAuthMember(request);

        model.addAttribute("member", member);

        return "/member/mypage";
    }

    // ======= 마이페이지 - 회원정보 변경 =======
    @GetMapping(value = "/member/auth/change_info")
    public String changeInfo(HttpServletRequest request, Model model) {
        Member member = getAuthMember(request);

        model.addAttribute("memberInfo", member);

        return "/member/changeMemberInfo";
    }

    @PostMapping(value = "/member/auth/change_info")
    public String changeInfoPost(HttpServletRequest request, Model model, MemberChangeForm memberChangeForm) {
        Member member = getAuthMember(request);

        Member mem = memberService.modify(member, memberChangeForm);

        model.addAttribute("member", mem);
        model.addAttribute("authUser", mem);

        return "/member/mypage";
    }

    // ======= 마이페이지 - 회원탈퇴 =======
    @GetMapping("/member/auth/withdraw")
    public String withdrawForm() {
        return "/member/withdrawForm";
    }

    @PostMapping("/member/auth/withdraw")
    public String withdraw(HttpServletRequest request, @RequestParam String pw, @RequestParam String confirmPw) {

        log.info("pw = {}", pw);
        log.info("confirmPw = {}", confirmPw);

        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        Map<String, Boolean> errors = new HashMap<>();
        request.setAttribute("errors", errors);

        // 비밀번호가 null 이거나 비밀번호 확인과 일치하지 않는다면
        if (!memberService.isPwEqualToConfirm(pw, confirmPw)) {
            errors.put("notMatch", Boolean.TRUE);

            return "/member/withdrawForm";
            // 입력한 비밀번호가 DB 비밀번호와 일치하지 않는다면
        } else if (!memberService.checkPwCorrect(mNumber, pw)) {
            errors.put("notCorrect", Boolean.TRUE);

            return "/member/withdrawForm";
        }

        memberService.withdraw(mNumber);
        // 세션 무효화
        request.getSession().invalidate();

        return "/member/withdrawSuccess";
    }

    // ======= 마이페이지 - 찾아요 매칭 결과 =======
    // 반려동물 찾아요 게시판에서 자신이 쓴 글 중
    // 유기동물 봤어요 게시판에 종, 종류, 위치가 같은 글이 있다면 매칭된 동물 조회
    @GetMapping("/member/auth/checkMatching")
    public String checkMatching(@RequestParam(required = false) String matched, HttpServletRequest request, Model model) {
        String pageNoVal = request.getParameter("pageNo");

        // 기본으로 1 페이지지만
        int pageNo = 1;

        // 페이지 값이 null 이 아니라면 그 요청 받은 파라미터 페이지 넘버로 변경
        if (pageNoVal != null) {
            pageNo = Integer.parseInt(pageNoVal);
        }

        // 세션으로 로그인 한 정보를 가지고 회원 정보 가져옴
        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        FindBoardPageForm Finds = findBoardService.getMembersFindPage(pageNo, mNumber, matched);
        model.addAttribute("Finds", Finds);

        request.getSession().setAttribute("matched", matched);

        return "/member/listFindBoard";
    }

    // ======= 마이페이지 - 찾아요 매칭 결과 - 세부 내용 =======
    @GetMapping("/member/auth/checkMatching/lookList")
    public String checkMatchingDetail(@RequestParam("faNumber") int faNumber, HttpServletRequest request, Model model) {
        FindBoard findBoard = findBoardService.getFindBoard(faNumber);

        String pageNoVal = request.getParameter("pageNo");

        // 기본으로 1 페이지지만
        int pageNo = 1;

        // 페이지 값이 null 이 아니라면 그 요청 받은 파라미터 페이지 넘버로 변경
        if (pageNoVal != null) {
            pageNo = Integer.parseInt(pageNoVal);
        }

        LookBoardPageForm boardPage = lookBoardService.getMatchedLookPage(pageNo, findBoard);
        model.addAttribute("matchedLookBoardForm", boardPage);

        return "/member/listLookBoard";
    }

    // ======= 마이페이지 - 신청 내역 - 임양 / 임시보호 신청 내역 =======
    @GetMapping("/member/auth/myApply/{type}")
    public String getMyApply(@PathVariable("type") String type, HttpServletRequest request, Model model) {
        String pageNoVal = request.getParameter("pageNo");

        // 기본으로 1 페이지지만
        int pageNo = 1;

        // 페이지 값이 null 이 아니라면 그 요청 받은 파라미터 페이지 넘버로 변경
        if (pageNoVal != null) {
            pageNo = Integer.parseInt(pageNoVal);
        }

        // 세션으로 로그인 한 정보를 가지고 회원 정보 가져옴
        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        log.info("type : {}", type);

        // type 이 입양이면 입양 신청 내역, 임시보호면 임시보호 신청 내역을 나타나게 한다.
        if (type.equals("adopt")) {
            AdoptApplyPageForm applyPage = adoptTempService.getAdoptApplyPage(pageNo, mNumber, type);
            model.addAttribute("applyListForm", applyPage);
        } else {
            TempApplyPageForm applyPage = adoptTempService.getTempApplyPage(pageNo, mNumber, type);
            model.addAttribute("applyListForm", applyPage);
        }

        request.getSession().setAttribute("type", type);

        return "/member/applyList";
    }

    // ======= 세션으로 로그인 정보 조회 =======
    private Member getAuthMember(HttpServletRequest request) {
        // 세션이 존재하면 세션 생성, 그 외 null 반환
        HttpSession session = request.getSession(false);
        // 세션 값 조회
        Member member = (Member) session.getAttribute("authUser");

        return member;
    }
}