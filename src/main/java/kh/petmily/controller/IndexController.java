package kh.petmily.controller;

import kh.petmily.domain.abandoned_animal.form.OldAbandonedAnimalListForm;
import kh.petmily.domain.adopt_review.form.AdoptReviewPreviewForm;
import kh.petmily.service.AbandonedAnimalService;
import kh.petmily.service.AdoptReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class IndexController {

    private final AdoptReviewService adoptReviewService;
    private final AbandonedAnimalService abandonedAnimalService;

    @GetMapping("/")
    public String adoptPreview(Model model) {
        List<AdoptReviewPreviewForm> detailForm = adoptReviewService.selectPreview();
        List<OldAbandonedAnimalListForm> listForm = abandonedAnimalService.oldAbandonedList();

        model.addAttribute("detailForm", detailForm);
        model.addAttribute("listForm", listForm);

        return "/main/index";
    }
}