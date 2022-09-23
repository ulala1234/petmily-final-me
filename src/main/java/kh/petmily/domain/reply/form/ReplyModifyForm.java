package kh.petmily.domain.reply.form;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReplyModifyForm {
    private int brNumber;
    private String reply;

    public ReplyModifyForm(int brNumber, String reply) {
        this.brNumber = brNumber;
        this.reply = reply;
    }
}