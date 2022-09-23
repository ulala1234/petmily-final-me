package kh.petmily.domain.reply.form;

import lombok.Data;

import java.sql.Date;

@Data
public class ReadReplyForm {
    private int brNumber;
    private int mNumber;
    private String reply;
    private Date wrTime;
    private String writer;
    private boolean sameWriter;

    public ReadReplyForm(int brNumber, int mNumber, String reply, Date wrTime, String writer) {
        this.brNumber = brNumber;
        this.mNumber = mNumber;
        this.reply = reply;
        this.wrTime = wrTime;
        this.writer = writer;
    }
}