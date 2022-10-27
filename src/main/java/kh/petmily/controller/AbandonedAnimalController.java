/*유기동물 컨트롤러 클래스로
내가 구현한 기능은
입양, 임시보호 신청서가 있다.*/

package kh.petmily.controller;

import kh.petmily.domain.abandoned_animal.form.*;
import kh.petmily.domain.member.Member;
import kh.petmily.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/abandoned_animal")
@RequiredArgsConstructor
@Slf4j
public class AbandonedAnimalController {

    private final AbandonedAnimalService abandonedAnimalService;
    private final AdoptTempService adoptTempService;
    private final DonateService donateService;
    private final MemberService memberService;
    private final VolunteerService volunteerService;

    @GetMapping("/list")
    public String list(@RequestParam(required = false) Integer pageNo,
                       @RequestParam(required = false) String species,
                       @RequestParam(required = false) String gender,
                       @RequestParam(required = false) String animalState,
                       @RequestParam(required = false) String keyword,
                       HttpServletRequest request,
                       Model model) {

        HttpSession session = request.getSession();

        if (pageNo == null) {
            initCondition(species, gender, animalState, keyword, session);
            pageNo = 1;
        }

        saveCondition(species, gender, animalState, keyword, session);

        species = (String) session.getAttribute("species");
        gender = (String) session.getAttribute("gender");
        animalState = (String) session.getAttribute("animalState");
        keyword = (String) session.getAttribute("keyword");

        log.info("species = {}", species);
        log.info("gender = {}", gender);
        log.info("animalState = {}", animalState);
        log.info("keyword = {}", keyword);

        AbandonedAnimalPageForm abandonedAnimals = abandonedAnimalService.getAbandonedAnimalPage(pageNo, species, gender, animalState, keyword);
        model.addAttribute("abandonedAnimals", abandonedAnimals);

        return "/abandoned_animal/listAbandonedAnimal";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("abNumber") int abNumber, Model model) {
        AbandonedAnimalDetailForm detailForm = abandonedAnimalService.getDetailForm(abNumber);
        log.info("detailForm = {}", detailForm);

        model.addAttribute("detailForm", detailForm);

        return "/abandoned_animal/detailAbandonedAnimal";
    }

    //=======후원하기=======
    @GetMapping("/auth/donate")
    public String donateForm(@RequestParam("abNumber") int abNumber, HttpServletRequest request, Model model) {

        Member member = getAuthMember(request);

        int mNumber = member.getMNumber();

        String animalName = abandonedAnimalService.findName(abNumber);
        String memberName = memberService.findName(mNumber);

        if (animalName != null) {
            request.setAttribute("animalName", animalName);
        }

        if (memberName != null) {
            request.setAttribute("memberName", memberName);
        }

        return "/abandoned_animal/donateSubmitForm";
    }

    @PostMapping("/auth/donate")
    public String donate(@ModelAttribute DonateSubmitForm donateSubmitForm, HttpServletRequest request) {

        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        donateSubmitForm.setMNumber(mNumber);
        log.info("donateSubmitForm = {}", donateSubmitForm);

        donateService.donate(donateSubmitForm);

        return "/abandoned_animal/submitSuccess";
    }

    // by 은지, ======= 입양 / 임시보호 신청서 =======
    @GetMapping("/auth/adopt_temp")
    public String adoptTempForm(@RequestParam int abNumber, HttpServletRequest request) {
        // 세션으로 로그인 한 정보를 가지고 회원 정보 가져오기
        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        // 화면에 유기동물 이름, 회원 이름 보이게 세팅
        String animalName = abandonedAnimalService.findName(abNumber);
        String memberName = memberService.findName(mNumber);

        if (animalName != null) {
            request.setAttribute("animalName", animalName);
        }

        if (memberName != null) {
            request.setAttribute("memberName", memberName);
        }

        return "/abandoned_animal/adoptTempSubmitForm";
    }

    @PostMapping("/auth/adopt_temp")
    public String adoptTemp(@ModelAttribute AdoptTempSubmitForm adoptTempSubmitForm,
                            @RequestParam String adoptOrTemp,
                            HttpServletRequest request) {
        log.info("adoptTempSubmitForm = {}", adoptTempSubmitForm);

        // 세션으로 로그인 한 정보를 가지고 회원 정보 가져오고
        // 입양 / 임시보호 신청서에 회원 정보 세팅
        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        adoptTempSubmitForm.setMNumber(mNumber);

        // view 와 연결되어
        // name 이 adoptOrTemp 인 value 가 adopt 인지 temp 인지에 따라 서비스 메소드를 다르게 설정
        if (adoptOrTemp.equals("adopt")) {
            adoptTempService.adopt(adoptTempSubmitForm);
        }

        if (adoptOrTemp.equals("temp")) {
            adoptTempService.tempProtect(adoptTempSubmitForm);
        }

        // by 은지, 221027 삭제, 불필요한 RedirectAttributes 삭제
        return "/abandoned_animal/submitSuccess";
    }

    //=======봉사하기=======
    @GetMapping("/auth/volunteer")
    public String volunteerForm(@RequestParam("abNumber") int abNumber, HttpServletRequest request, Model model) {
        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        String animalName = volunteerService.findAnimalName(abNumber);
        String memberName = volunteerService.findMemberName(mNumber);
        String memberBirth = volunteerService.findMemberBirth(mNumber);
        String memberPhone = volunteerService.findMemberPhone(mNumber);
        String memberEmail = volunteerService.findMemberEmail(mNumber);

        if (animalName != null) {
            model.addAttribute("animalName", animalName);
        }

        if (memberName != null) {
            model.addAttribute("memberName", memberName);
        }

        if (memberBirth != null) {
            model.addAttribute("memberBirth", memberBirth);
        }

        if (memberPhone != null) {
            model.addAttribute("memberPhone", memberPhone);
        }

        if (memberEmail != null) {
            model.addAttribute("memberEmail", memberEmail);
        }

        return "/abandoned_animal/volunteerAbandonedAnimal";
    }

    @PostMapping("/auth/volunteer")
    public String volunteer(@RequestParam("abNumber") int abNumber, @ModelAttribute VolunteerApplySubmitForm volunteerApplySubmitForm, HttpServletRequest request) {
        log.info("volunteerApplySubmitForm = {}", volunteerApplySubmitForm);

        Member member = getAuthMember(request);
        int mNumber = member.getMNumber();

        int sNumber = volunteerService.findsNumber(abNumber);

        volunteerApplySubmitForm.setMNumber(mNumber);
        volunteerApplySubmitForm.setSNumber(sNumber);

        volunteerService.volunteer(volunteerApplySubmitForm);

        return "/abandoned_animal/submitSuccess";
    }

    // ======= 세션으로 로그인 정보 조회 =======
    private Member getAuthMember(HttpServletRequest request) {
        // 세션이 존재하면 세션 생성, 그 외 null 반환
        HttpSession session = request.getSession(false);
        // 세션 값 조회
        Member member = (Member) session.getAttribute("authUser");

        return member;
    }

    private void saveCondition(String species, String gender, String animalState, String keyword, HttpSession session) {
        if (species != null) {
            session.setAttribute("species", species);
        }

        if (gender != null) {
            session.setAttribute("gender", gender);
        }

        if (animalState != null) {
            session.setAttribute("animalState", animalState);
        }

        if (keyword != null) {
            if (!keyword.equals("")) {
                session.setAttribute("keyword", keyword);
            } else {
                session.setAttribute("keyword", "allKeyword");
            }
        }
    }

    private void initCondition(String species, String gender, String animalState, String keyword, HttpSession session) {
        if (species == null && gender == null && animalState == null && keyword == null) {
            session.removeAttribute("species");
            session.removeAttribute("gender");
            session.removeAttribute("animalState");
            session.removeAttribute("keyword");
        }
    }
}
