package kh.petmily.domain.donation.form;

import lombok.Data;

@Data
public class DonationListForm {

    private int dNumber;
    private int abNumber;
    private String abName;
    private int mNumber;
    private String mName;
    private int donaSum;
    private String bank;
    private String accountHolder;
    private String accountNumber;

    public DonationListForm(int dNumber, int abNumber, String abName, int mNumber, String mName, int donaSum, String bank, String accountHolder, String accountNumber) {
        this.dNumber = dNumber;
        this.abNumber = abNumber;
        this.abName = abName;
        this.mNumber = mNumber;
        this.mName = mName;
        this.donaSum = donaSum;
        this.bank = bank;
        this.accountHolder = accountHolder;
        this.accountNumber = accountNumber;
    }

    public DonationListForm(int abNumber, String abName, int mNumber, String mName, int donaSum, String bank, String accountHolder, String accountNumber) {
        this.abNumber = abNumber;
        this.abName = abName;
        this.mNumber = mNumber;
        this.mName = mName;
        this.donaSum = donaSum;
        this.bank = bank;
        this.accountHolder = accountHolder;
        this.accountNumber = accountNumber;
    }

    public DonationListForm(int dNumber, int abNumber, String abName, int mNumber, String mName, int donaSum) {
        this.dNumber = dNumber;
        this.abNumber = abNumber;
        this.abName = abName;
        this.mNumber = mNumber;
        this.mName = mName;
        this.donaSum = donaSum;
    }
}
