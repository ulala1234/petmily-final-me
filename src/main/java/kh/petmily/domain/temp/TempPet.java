package kh.petmily.domain.temp;

import kh.petmily.domain.DomainObj;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;

@Getter
@NoArgsConstructor
public class TempPet implements DomainObj {
    private int tNumber; // 임보 번호
    private int abNumber;
    private int mNumber;
    private Date tempDate;
    private int tempPeriod;
    private String residence;
    private String maritalStatus;
    private String job;
    private String status;

    public TempPet(int abNumber, int mNumber, String residence, String maritalStatus, String job) {
        this.abNumber = abNumber;
        this.mNumber = mNumber;
        this.residence = residence;
        this.maritalStatus = maritalStatus;
        this.job = job;
    }
}