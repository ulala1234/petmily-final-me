package kh.petmily.domain.adopt.form;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AdoptDetailForm {

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

    public AdoptDetailForm(int adNumber, int mNumber, int abNumber, String residence, String maritalStatus, String job, String status, String animalName, String memberName, String memberId) {
        this.adNumber = adNumber;
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
