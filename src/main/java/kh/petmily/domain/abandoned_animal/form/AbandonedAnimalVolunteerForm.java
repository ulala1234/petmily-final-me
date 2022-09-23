package kh.petmily.domain.abandoned_animal.form;

import lombok.Data;

import java.sql.Date;

@Data
public class AbandonedAnimalVolunteerForm {

    private int vNumber;
    private int sNumber;
    private String recPer;
    private Date regDate;

    public AbandonedAnimalVolunteerForm(int sNumber, String recPer, Date regDate) {
        super();
        this.sNumber = sNumber;
        this.recPer = recPer;
        this.regDate = regDate;
    }

    public int getvNumber() {
        return vNumber;
    }

    public void setvNumber(int vNumber) {
        this.vNumber = vNumber;
    }

    public int getsNumber() {
        return sNumber;
    }

    public void setsNumber(int sNumber) {
        this.sNumber = sNumber;
    }

    public String getRecPer() {
        return recPer;
    }

    public void setRecPer(String recPer) {
        this.recPer = recPer;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

}
