package kh.petmily.service;

import kh.petmily.dao.DonationDao;
import kh.petmily.domain.abandoned_animal.form.DonateSubmitForm;
import kh.petmily.domain.donation.Donation;
import kh.petmily.domain.donation.form.DonationCreateForm;
import kh.petmily.domain.donation.form.DonationDetailForm;
import kh.petmily.domain.donation.form.DonationModifyForm;
import kh.petmily.domain.donation.form.DonationPageForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class DonateServiceImpl implements DonateService {

    private final DonationDao donationDao;

    private int size = 10;

    @Override
    public DonationPageForm getDonationPage(int pageNo) {
        int total = donationDao.selectCount();
        List<DonationDetailForm> content = donationDao.selectIndex((pageNo - 1) * size + 1, (pageNo - 1) * size + size);

        return new DonationPageForm(total, pageNo, size, content);
    }

    @Override
    public DonationDetailForm getDonation(int dNumber) {
        Donation donation = donationDao.findByPk(dNumber);

        return new DonationDetailForm(
                donation.getDNumber(),
                donation.getAbNumber(),
                donation.getMNumber(),
                donation.getDonaSum(),
                donation.getBank(),
                donation.getAccountHolder(),
                donation.getAccountNumber());
    }

    @Override
    public DonationModifyForm getDonationModify(int dNumber) {
        Donation donation = donationDao.findByPk(dNumber);
        DonationModifyForm donationModifyForm = toDonationModify(donation);

        return donationModifyForm;
    }

    @Override
    public void create(DonationCreateForm donationCreateForm) {
        Donation donation = toDonation(donationCreateForm);

        donationDao.insert(donation);
    }

    @Override
    public void modify(DonationModifyForm donationModifyForm) {
        Donation donation = toDonation(donationModifyForm);

        donationDao.update(donation);
    }

    @Override
    public void delete(int dNumber) {
        donationDao.delete(dNumber);
    }

    @Override
    public void donate(DonateSubmitForm donateSubmitForm) {
        Donation donation = toDonation(donateSubmitForm);
        log.info("donation = {}", donation);

        donationDao.insert(donation);
    }

    private Donation toDonation(DonationCreateForm donationCreateForm) {
        Donation donation = new Donation(
                donationCreateForm.getAbNumber(),
                donationCreateForm.getMNumber(),
                donationCreateForm.getDonaSum(),
                donationCreateForm.getBank(),
                donationCreateForm.getAccountHolder(),
                donationCreateForm.getAccountNumber());

        return donation;
    }

    private Donation toDonation(DonationModifyForm donationModifyForm) {
        Donation donation = new Donation(
                donationModifyForm.getDNumber(),
                donationModifyForm.getAbNumber(),
                donationModifyForm.getMNumber(),
                donationModifyForm.getDonaSum(),
                donationModifyForm.getBank(),
                donationModifyForm.getAccountHolder(),
                donationModifyForm.getAccountNumber());

        return donation;
    }

    private DonationModifyForm toDonationModify(Donation donation) {
        return new DonationModifyForm(donation.getDNumber(), donation.getAbNumber(), donation.getMNumber(), donation.getDonaSum(), donation.getBank(), donation.getAccountHolder(), donation.getAccountNumber());
    }

    private Donation toDonation(DonateSubmitForm donateSubmitForm) {
        Donation donation = new Donation(
                donateSubmitForm.getAbNumber(),
                donateSubmitForm.getMNumber(),
                donateSubmitForm.getDonaSum(),
                donateSubmitForm.getBank(),
                donateSubmitForm.getAccountHolder(),
                donateSubmitForm.getAccountNumber());
        return donation;
    }
}
