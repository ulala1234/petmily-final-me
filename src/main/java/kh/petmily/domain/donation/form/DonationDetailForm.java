package kh.petmily.domain.donation.form;

import lombok.Data;

@Data
public class DonationDetailForm {

    private int dNumber;
    private int abNumber;
    private String abName;
    private int mNumber;
    private String mName;
    private int donaSum;
    private String bank;
    private String accountHolder;
    private String accountNumber;

    public DonationDetailForm(int dNumber, int abNumber, String abName, int mNumber, String mName, int donaSum, String bank, String accountHolder, String accountNumber) {
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

    public DonationDetailForm(int dNumber, int abNumber, int mNumber, int donaSum, String bank, String accountHolder, String accountNumber) {
        this.dNumber = dNumber;
        this.abNumber = abNumber;
        this.mNumber = mNumber;
        this.donaSum = donaSum;
        this.bank = bank;
        this.accountHolder = accountHolder;
        this.accountNumber = accountNumber;
    }

    public DonationDetailForm(int abNumber, int mNumber, int donaSum, String bank, String accountHolder, String accountNumber) {
        this.abNumber = abNumber;
        this.mNumber = mNumber;
        this.donaSum = donaSum;
        this.bank = bank;
        this.accountHolder = accountHolder;
        this.accountNumber = accountNumber;
    }
}
