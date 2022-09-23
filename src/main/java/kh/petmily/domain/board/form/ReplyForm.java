package kh.petmily.domain.board.form;

import java.sql.Date;

public class ReplyForm {

    private int brNumber;
    private int mNumber;
    private String name;
    private Date wrTime;
    private String reply;

    public ReplyForm(int brNumber, int mNumber, String name, Date wrTime, String reply) {
        this.brNumber = brNumber;
        this.mNumber = mNumber;
        this.name = name;
        this.wrTime = wrTime;
        this.reply = reply;
    }

    public int getBrNumber() {
        return brNumber;
    }

    public void setBrNumber(int brNumber) {
        this.brNumber = brNumber;
    }

    public int getmNumber() {
        return mNumber;
    }

    public void setmNumber(int mNumber) {
        this.mNumber = mNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getWrTime() {
        return wrTime;
    }

    public void setWrTime(Date wrTime) {
        this.wrTime = wrTime;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }
}
