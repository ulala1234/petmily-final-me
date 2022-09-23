package kh.petmily.service;

import kh.petmily.domain.abandoned_animal.form.DonateSubmitForm;
import kh.petmily.domain.donation.form.DonationCreateForm;
import kh.petmily.domain.donation.form.DonationDetailForm;
import kh.petmily.domain.donation.form.DonationModifyForm;
import kh.petmily.domain.donation.form.DonationPageForm;

public interface DonateService {

    public DonationPageForm getDonationPage(int pageNo);

    public DonationDetailForm getDonation(int dNumber);

    public DonationModifyForm getDonationModify(int dNumber);

    public void create(DonationCreateForm donationCreateForm);

    public void modify(DonationModifyForm donationModifyForm);

    public void delete(int dNumber);

    public void donate(DonateSubmitForm donateSubmitForm);
}
