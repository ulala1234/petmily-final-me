package kh.petmily.domain.abandoned_animal.form;

import lombok.Data;

import java.sql.Date;

@Data
public class AdoptTempSubmitForm {

    private int adNumber; // 입양 번호
    private int mNumber;
    private int abNumber;
    private String residence;
    private String maritalStatus;
    private String job;
    private String status = "처리중";

    private int tNumber; // 임보 번호
    private Date tempDate;
    private int tempPeriod;

    public AdoptTempSubmitForm(int abNumber, String residence, String maritalStatus, String job) {
        this.abNumber = abNumber;
        this.residence = residence;
        this.maritalStatus = maritalStatus;
        this.job = job;
    }
}
