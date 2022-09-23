package kh.petmily.controller;

import kh.petmily.domain.member.Member;
import kh.petmily.domain.reply.form.ReadReplyForm;
import kh.petmily.domain.reply.form.ReplyModifyForm;
import kh.petmily.domain.reply.form.ReplyWriteForm;
import kh.petmily.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/replies")
@RequiredArgsConstructor
@Slf4j
public class ReplyController {

    private final ReplyService replyService;

    @GetMapping("/{bNumber}")
    public ResponseEntity<List<ReadReplyForm>> list(@PathVariable("bNumber") int bNumber, HttpServletRequest request) {
        Member authMember = (Member) request.getSession(false).getAttribute("authUser");

        List<ReadReplyForm> list = replyService.getList(bNumber);

        if (authMember != null) {
            for (ReadReplyForm readReplyForm : list) {
                if (readReplyForm.getMNumber() == authMember.getMNumber()) {
                    readReplyForm.setSameWriter(true);
                }
            }
        }

        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping("/{bNumber}")
    public String register(@RequestBody ReplyWriteForm replyWriteForm) {
        log.info("replyWriteForm = {}", replyWriteForm);
        replyService.write(replyWriteForm);

        return "SUCCESS";
    }

    @PatchMapping("/{bNumber}")
    public String update(@RequestBody ReplyModifyForm replyModifyForm) {
        log.info("replyModifyForm = {}", replyModifyForm);
        replyService.modify(replyModifyForm);

        return "SUCCESS";
    }

    @DeleteMapping("/{brNumber}")
    public String remove(@PathVariable("brNumber") int brNumber) {
        replyService.delete(brNumber);

        return "SUCCESS";
    }
}