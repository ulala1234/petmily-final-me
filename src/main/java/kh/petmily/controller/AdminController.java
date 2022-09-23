package kh.petmily.controller;

import kh.petmily.domain.abandoned_animal.AbandonedAnimal;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalDetailForm;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalModifyForm;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalPageForm;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalWriteForm;
import kh.petmily.domain.admin.form.AdminBoardListForm;
import kh.petmily.domain.adopt.form.AdoptPageForm;
import kh.petmily.domain.adopt.form.TempPageForm;
import kh.petmily.domain.adopt_review.form.AdoptReviewModifyForm;
import kh.petmily.domain.board.form.BoardModifyForm;
import kh.petmily.domain.donation.form.DonationCreateForm;
import kh.petmily.domain.donation.form.DonationDetailForm;
import kh.petmily.domain.donation.form.DonationModifyForm;
import kh.petmily.domain.donation.form.DonationPageForm;
import kh.petmily.domain.find_board.form.FindBoardModifyForm;
import kh.petmily.domain.look_board.form.LookBoardModifyForm;
import kh.petmily.domain.member.Member;
import kh.petmily.domain.member.form.JoinRequest;
import kh.petmily.domain.member.form.MemberModifyForm;
import kh.petmily.domain.member.form.MemberPageForm;
import kh.petmily.domain.pet.Pet;
import kh.petmily.domain.pet.form.PetForm;
import kh.petmily.domain.pet.form.PetPageForm;
import kh.petmily.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    private final MemberService memberService;
    private final BoardService boardService;
    private final AdoptReviewService adoptReviewService;
    private final FindBoardService findBoardService;
    private final LookBoardService lookBoardService;
    private final DonateService donateService;
    private final AbandonedAnimalService abandonedAnimalService;
    private final AdoptTempService adoptTempService;

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

    @GetMapping
    public String adminPage() {
        return "/admin/adminPage";
    }

    // 회원 리스트
    @GetMapping("/member")
    public String memberPage(@RequestParam(defaultValue = "1") int pageNo, Model model) {
        MemberPageForm memberPageForm = memberService.getMemberPage(pageNo);
        model.addAttribute("memberPageForm", memberPageForm);

        return "/admin/member/adminMemberList";
    }

    // 회원 정보 추가(insert)
    @GetMapping("/member/insert")
    public String memberCreateForm() {
        return "admin/member/adminInsertForm";
    }

    @PostMapping("/member/insert")
    public String join(@ModelAttribute("joinRequest") JoinRequest joinRequest) {

        if (!joinRequest.isPwEqualToConfirm()) {
            return "/admin/member/adminInsertForm";
        }
        memberService.join(joinRequest);
        return "/admin/member/insertSuccess";
    }

    // 회원 정보 수정(modify)
    @GetMapping("/member/modify")
    public String memberDetailModify(@RequestParam("mNumber") int mNumber, Model model) {
        MemberModifyForm memberModifyForm = memberService.getMemberModify(mNumber);
        memberModifyForm.setMNumber(mNumber);

        model.addAttribute("member", memberModifyForm);

        return "admin/member/adminMemberModify";
    }

    @PostMapping("/member/modify")
    public String memberModify(@ModelAttribute MemberModifyForm memberModifyForm, Model model, RedirectAttributes redirectAttributes) {
        log.info("memberModifyForm = {}", memberModifyForm);

        memberService.modify(memberModifyForm);

        model.addAttribute("memberModify", memberModifyForm);

        return "redirect:/admin/member";
    }

    // 회원 정보 삭제(delete)
    @GetMapping("/member/delete")
    public String MemberDelete(@RequestParam("mNumber") int mNumber) {
        memberService.delete(mNumber);

        return "/admin/member/deleteMemberSuccess";
    }

    @GetMapping("/animal")
    public String animalPage() {
        return "/admin/animal/animalPage";
    }

    @GetMapping("/animal/abandoned")
    public String adminAbandonedList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
        AbandonedAnimalPageForm abandonedAnimals = abandonedAnimalService.getAbandonedAnimalPage(pageNo);
        model.addAttribute("abandonedAnimals", abandonedAnimals);

        return "/admin/animal/adminAbandonedList";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("abNumber") int abNumber, Model model) {
        AbandonedAnimalDetailForm detailForm = abandonedAnimalService.getDetailForm(abNumber);
        log.info("detailForm = {}", detailForm);

        model.addAttribute("detailForm", detailForm);

        return "/abandoned_animal/detailAbandonedAnimal";
    }


    @GetMapping("/animal/abandoned/write")
    public String adminAbandonedWriteForm() {
        return "/admin/animal/AbandonedAnimalWriteForm";
    }

    @PostMapping("/animal/abandoned/write")
    public String adminAbandonedWrite(@ModelAttribute AbandonedAnimalWriteForm abandonedAnimalWriteForm, HttpServletRequest request) {
        String fullPath = request.getSession().getServletContext().getRealPath("/");
        fullPath = fullPath + "resources/upload/";

        String filename = "";

        if (!abandonedAnimalWriteForm.getImgPath().isEmpty()) {
            try {
                filename = abandonedAnimalService.storeFile(abandonedAnimalWriteForm.getImgPath(), fullPath);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            abandonedAnimalWriteForm.setFullPath(filename);
        } else {
            abandonedAnimalWriteForm.setFullPath("");
        }

        log.info("AbandonedAnimalWriteForm = {}", abandonedAnimalWriteForm);

        abandonedAnimalService.write(abandonedAnimalWriteForm);

        return "/admin/animal/writeSuccess";
    }

    @GetMapping("/animal/abandoned/modify")
    public String adminAbandonedModifyForm(@RequestParam("abNumber") int abNumber, Model model) {
        AbandonedAnimalModifyForm modReq = abandonedAnimalService.getAbandonedModify(abNumber);

        model.addAttribute("modReq", modReq);

        return "/admin/animal/AbandonedAnimalModifyForm";
    }

    @PostMapping("/animal/abandoned/modify")
    public String adminAbandonedModify(@RequestParam("abNumber") int abNumber,
                                       @ModelAttribute AbandonedAnimalModifyForm modReq,
                                       HttpServletRequest request,
                                       Model model,
                                       RedirectAttributes redirectAttributes) {
        String fullPath = request.getSession().getServletContext().getRealPath("/");
        fullPath = fullPath + "resources/upload/";

        modReq.setAbNumber(abNumber);
        String filename = null;

        try {
            filename = abandonedAnimalService.storeFile(modReq.getImgPath(), fullPath);
            modReq.setFullPath(filename);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        log.info("AbandonedAnimalModifyForm = {}", modReq);

        abandonedAnimalService.modify(modReq);
        model.addAttribute("modReq", modReq);
        redirectAttributes.addAttribute("abNumber", abNumber);

        log.info("ModifyForm = {}", modReq);

        return "redirect:/admin/animal/abandoned";
    }

    @GetMapping("/animal/abandoned/delete")
    public String adminAbandonedDelete(@RequestParam("abNumber") int abNumber, RedirectAttributes redirectAttributes) {
        abandonedAnimalService.delete(abNumber);
        redirectAttributes.addAttribute("abNumber", abNumber);

        return "redirect:/admin/animal/abandoned";
    }

    @GetMapping("/board")
    public String boardPage(@RequestParam("kindOfBoard") String kind, Model model) {
        List<AdminBoardListForm> boardForm = new ArrayList<>();

        if (kind.equals("자유")) {
            boardForm = boardService.selectAll("자유");
        } else if (kind.equals("문의")) {
            boardForm = boardService.selectAll("문의");
        } else if (kind.equals("입양후기")) {
            boardForm = adoptReviewService.selectAll("입양후기");
        } else if (kind.equals("find")) {
            boardForm = findBoardService.selectAll();
        } else if (kind.equals("look")) {
            boardForm = lookBoardService.selectAll();
        }

        model.addAttribute("boardForm", boardForm);

        return "/admin/board/adminBoardList";
    }

    @GetMapping("/board/write")
    public String boardWrite(@RequestParam("kindOfBoard") String kind, Model model) {
        List<Member> list = memberService.selectAll();
        model.addAttribute("Mems", list);

        if (kind.equals("자유") || kind.equals("문의")) {

            return "/board/writeBoardForm";
        } else if (kind.equals("입양후기")) {

            return "/adopt_review/writeAdoptReviewForm";
        } else if (kind.equals("find")) {

            return "/find_board/writeFindBoardForm";
        } else if (kind.equals("look")) {

            return "/look_board/writeLookBoardForm";
        }
        return null;
    }

    @GetMapping("/board/modify")
    public String boardModify(@RequestParam("kindOfBoard") String kind, @RequestParam("pk") int pk, Model model) {
        if (kind.equals("자유") || kind.equals("문의")) {
            BoardModifyForm bmForm = boardService.getBoardModify(pk);

            int mNumber = boardService.getBoard(pk).getMNumber();
            bmForm.setMNumber(mNumber);
            bmForm.setBNumber(pk);

            model.addAttribute("modReq", bmForm);

            return "/board/modifyForm";
        } else if (kind.equals("입양후기")) {
            AdoptReviewModifyForm armForm = adoptReviewService.getAdoptReviewModify(pk);

            int mNumber = adoptReviewService.getAdoptReview(pk).getMNumber();
            armForm.setMNumber(mNumber);
            armForm.setBNumber(pk);

            model.addAttribute("modReq", armForm);

            return "/adopt_review/modifyAdoptReviewForm";
        } else if (kind.equals("find")) {
            FindBoardModifyForm fmForm = findBoardService.getModifyForm(pk);

            int mNumber = findBoardService.getFindBoard(pk).getMNumber();
            fmForm.setMNumber(mNumber);
            fmForm.setFaNumber(pk);

            model.addAttribute("findMod", fmForm);

            return "/find_board/modifyFindBoardForm";
        } else if (kind.equals("look")) {
            LookBoardModifyForm lmForm = lookBoardService.getModifyForm(pk);

            int mNumber = lookBoardService.getLookBoard(pk).getMNumber();
            lmForm.setMNumber(mNumber);
            lmForm.setLaNumber(pk);

            model.addAttribute("lookMod", lmForm);

            return "/look_board/modifyLookBoardForm";
        }

        return null;
    }

    @GetMapping("/board/delete")
    public String boardDelete(@RequestParam("kindOfBoard") String kind, @RequestParam("pk") int pk, RedirectAttributes redirectAttributes) {
        if (kind.equals("자유") || kind.equals("문의")) {
            boardService.delete(pk);
        } else if (kind.equals("입양후기")) {
            adoptReviewService.delete(pk);
        } else if (kind.equals("find")) {
            findBoardService.delete(pk);
        } else if (kind.equals("look")) {
            lookBoardService.delete(pk);
        }

        redirectAttributes.addAttribute("kindOfBoard", kind);

        return "redirect:/admin/board?kindOfBoard={kindOfBoard}";
    }

    @GetMapping("/animal/pet")
    public String petBoard(@RequestParam(defaultValue = "1") int pageNum, Model model) {
        PetPageForm petPage = abandonedAnimalService.getPetPage(pageNum);
        model.addAttribute("petPage", petPage);
        return "/admin/animal/petBoard";
    }

    @ResponseBody
    @PostMapping("/animal/pet")
    public String petBoard(PetForm pet) {
        try {
            abandonedAnimalService.savePet(new Pet(pet));
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            return "없는 회원 아이디거나 등록할수없는 종입니다.";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        return "성공";
    }

    @ResponseBody
    @PostMapping("/animal/pet/update")
    public String petUpdate(PetForm pet) {
        try {
            abandonedAnimalService.modifyPet(new Pet(pet));
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            return "등록할수없는 종입니다.";
        } catch (UncategorizedSQLException e) {
            e.printStackTrace();
            return "없는 회원아이디입니다.";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        return "성공";
    }

    @GetMapping("/animal/pet/delete/{cpNumber}")
    public String animalDelete(@PathVariable int cpNumber) {
        abandonedAnimalService.deletePet(cpNumber);
        return "redirect:/admin/animal/pet";
    }

    // 입양/임보 관리 메인 페이지
    @GetMapping("/adopt_temp")
    public String adoptTempTotalList() {
        return "/admin/adoptTemp/adoptTempTotalList";
    }

    // 입양/임보 대기 선택 페이지
    @GetMapping("/adopt_temp/wait")
    public String adoptTempWaitList() {
        return "/admin/adoptTemp/adoptTempWaitList";
    }

    // 입양 대기 페이지
    @GetMapping("/adopt_temp/wait/adopt")
    public String waitAdoptDetail(@RequestParam(defaultValue = "1") int pageNo,
                                  @RequestParam(defaultValue = "처리중") String status,
                                  Model model) {

        AdoptPageForm adopt = adoptTempService.getAdoptWaitPage(pageNo, status);
        model.addAttribute("adopt", adopt);

        return "/admin/adoptTemp/waitAdoptDetail";
    }

    // 입양 승인 버튼
    @GetMapping("/adopt_temp/wait/adopt/approve")
    public String adoptApprove(@RequestParam int adNumber) {

        adoptTempService.adoptApprove(adNumber);

        return "/admin/adoptTemp/adoptSuccess";
    }

    // 입양 거절 버튼
    @GetMapping("/adopt_temp/wait/adopt/refuse")
    public String adoptRefuse(@RequestParam int adNumber) {

        adoptTempService.adoptRefuse(adNumber);

        return "/admin/adoptTemp/adoptRefuse";
    }

    // 임보 대기 페이지
    @GetMapping("/adopt_temp/wait/temp_pet")
    public String waitTempDetail(@RequestParam(defaultValue = "1") int pageNo,
                                 @RequestParam(defaultValue = "처리중") String status,
                                 Model model) {

        TempPageForm temp = adoptTempService.getTempWaitPage(pageNo, status);
        model.addAttribute("temp", temp);

        return "/admin/adoptTemp/waitTempPetDetail";
    }

    // 임보 승인 버튼
    @GetMapping("/adopt_temp/wait/temp_pet/approve")
    public String tempApprove(@RequestParam int tNumber) {

        adoptTempService.tempApprove(tNumber);

        return "/admin/adoptTemp/tempSuccess";
    }

    // 임보 거절 버튼
    @GetMapping("/adopt_temp/wait/temp_pet/refuse")
    public String tempRefuse(@RequestParam int tNumber) {

        adoptTempService.tempRefuse(tNumber);

        return "/admin/adoptTemp/tempRefuse";
    }

    // 입양/임보 완료 선택 페이지
    @GetMapping("/adopt_temp/complete")
    public String adoptTempCompleteList() {
        return "/admin/adoptTemp/adoptTempCompleteList";
    }

    // 입양 완료된 리스트
    @GetMapping("/adopt_temp/complete/adopt")
    public String completeAdoptDetail(@RequestParam(defaultValue = "1") int pageNo,
                                      @RequestParam(defaultValue = "완료") String status,
                                      Model model) {

        AdoptPageForm adopt = adoptTempService.getAdoptWaitPage(pageNo, status);
        model.addAttribute("adopt", adopt);

        return "/admin/adoptTemp/completeAdoptDetail";
    }

    // 임보 완료된 리스트
    @GetMapping("/adopt_temp/complete/temp_pet")
    public String completeTempPetDetail(@RequestParam(defaultValue = "1") int pageNo,
                                        @RequestParam(defaultValue = "완료") String status,
                                        Model model) {

        TempPageForm temp = adoptTempService.getTempWaitPage(pageNo, status);
        model.addAttribute("temp", temp);

        return "/admin/adoptTemp/completeTempPetDetail";
    }

    // 입양/임보 거절 선택 페이지
    @GetMapping("/adopt_temp/refuse")
    public String adoptTempRefuseList() {
        return "/admin/adoptTemp/adoptTempRefuseList";
    }

    // 입양 거절된 리스트
    @GetMapping("/adopt_temp/refuse/adopt")
    public String refuseAdoptDetail(@RequestParam(defaultValue = "1") int pageNo,
                                    @RequestParam(defaultValue = "거절") String status,
                                    Model model) {

        AdoptPageForm adopt = adoptTempService.getAdoptWaitPage(pageNo, status);
        model.addAttribute("adopt", adopt);

        return "/admin/adoptTemp/refuseAdoptDetail";
    }

    // 임보 거절된 리스트
    @GetMapping("/adopt_temp/refuse/temp_pet")
    public String refuseTempPetDetail(@RequestParam(defaultValue = "1") int pageNo,
                                      @RequestParam(defaultValue = "거절") String status,
                                      Model model) {

        TempPageForm temp = adoptTempService.getTempWaitPage(pageNo, status);
        model.addAttribute("temp", temp);

        return "/admin/adoptTemp/refuseTempPetDetail";
    }

    @GetMapping("/donation")
    public String donationPage(@RequestParam(defaultValue = "1") int pageNo, Model model) {
        DonationPageForm donationPageForm = donateService.getDonationPage(pageNo);
        model.addAttribute("donationPageForm", donationPageForm);

        return "/admin/donation/donationList";
    }

    @GetMapping("/donation/detail")
    public String donationDetail(@RequestParam("dNumber") int dNumber,
                                 @RequestParam("abNumber") int abNumber,
                                 @RequestParam("mNumber") int mNumber,
                                 HttpServletRequest request,
                                 Model model) {
        String animalName = abandonedAnimalService.findName(abNumber);
        String memberName = memberService.findName(mNumber);

        if (animalName != null) {
            request.setAttribute("animalName", animalName);
        }

        if (memberName != null) {
            request.setAttribute("memberName", memberName);
        }

        DonationDetailForm donationDetailForm = donateService.getDonation(dNumber);

        model.addAttribute("donationDetail", donationDetailForm);

        return "/admin/donation/donationDetail";
    }

    @GetMapping("donation/create")
    public String donationCreateForm(Model model) {
        List<AbandonedAnimal> abandonedAnimals = abandonedAnimalService.selectAll();
        List<Member> members = memberService.selectAll();

        model.addAttribute("abandonedAnimals", abandonedAnimals);
        model.addAttribute("members", members);

        return "/admin/donation/createDonation";
    }

    @PostMapping("donation/create")
    public String donationCreate(@ModelAttribute DonationCreateForm donationCreateForm, Model model) {
        donateService.create(donationCreateForm);

        return "/admin/donation/createDonationSuccess";
    }

    @GetMapping("donation/modify")
    public String donationModifyForm(@RequestParam("dNumber") int dNumber, Model model) {
        List<AbandonedAnimal> abandonedAnimals = abandonedAnimalService.selectAll();
        List<Member> members = memberService.selectAll();

        DonationModifyForm donationModifyForm = donateService.getDonationModify(dNumber);

        donationModifyForm.setDNumber(dNumber);
        log.info("dNumber = {}", dNumber);

        model.addAttribute("abandonedAnimals", abandonedAnimals);
        model.addAttribute("members", members);
        model.addAttribute("donationModify", donationModifyForm);

        return "/admin/donation/modifyDonation";
    }

    @PostMapping("donation/modify")
    public String donationModify(@RequestParam("dNumber") int dNumber,
                                 @RequestParam("abNumber") int abNumber,
                                 @RequestParam("mNumber") int mNumber,
                                 @ModelAttribute DonationModifyForm donationModifyForm, Model model, RedirectAttributes redirectAttributes) {
        donationModifyForm.setDNumber(dNumber);
        log.info("dNumber = {}", dNumber);

        donateService.modify(donationModifyForm);

        model.addAttribute("donationModify", donationModifyForm);

        redirectAttributes.addAttribute("dNumber", dNumber);
        redirectAttributes.addAttribute("abNumber", abNumber);
        redirectAttributes.addAttribute("mNumber", mNumber);

        return "redirect:/admin/donation/detail?dNumber={dNumber}&abNumber={abNumber}&mNumber={mNumber}";
    }

    @GetMapping("/donation/delete")
    public String delete(@RequestParam("dNumber") int dNumber) {
        donateService.delete(dNumber);

        return "/admin/donation/deleteDonationSuccess";
    }

}
