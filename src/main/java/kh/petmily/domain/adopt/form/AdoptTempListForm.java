package kh.petmily.domain.adopt.form;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
public class AdoptTempListForm {

    private int adNumber;
    private int mNumber;
    private int abNumber;
    private String residence;
    private String maritalStatus;
    private String job;
    private String status = "처리중";

    private String animalName;
    private String memberName;
    private String memberId;

    private int tNumber; // 임보 번호
    private Date tempDate;
    private int tempPeriod;

    public AdoptTempListForm(int abNumber, String residence, String maritalStatus, String job) {
        this.abNumber = abNumber;
        this.residence = residence;
        this.maritalStatus = maritalStatus;
        this.job = job;
    }

    public AdoptTempListForm(int mNumber, int abNumber, String residence, String maritalStatus, String job, String status, String animalName, String memberName, String memberId) {
        this.mNumber = mNumber;
        this.abNumber = abNumber;
        this.residence = residence;
        this.maritalStatus = maritalStatus;
        this.job = job;
        this.status = status;
        this.animalName = animalName;
        this.memberName = memberName;
        this.memberId = memberId;
    }

}
