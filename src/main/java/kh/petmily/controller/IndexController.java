package kh.petmily.controller;


import kh.petmily.domain.abandoned_animal.form.OldAbandonedAnimalListForm;
import kh.petmily.service.AbandonedAnimalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor

public class IndexController {
    private final AbandonedAnimalService abandonedAnimalService;

    @GetMapping("/")
    public String oldAbandonedList(Model model) {
        List<OldAbandonedAnimalListForm> listForm = abandonedAnimalService.oldAbandonedList();
        model.addAttribute("listForm", listForm);

        return "/main/index";
    }
}