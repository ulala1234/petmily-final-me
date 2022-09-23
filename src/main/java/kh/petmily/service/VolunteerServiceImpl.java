package kh.petmily.service;

import kh.petmily.dao.AbandonedAnimalDao;
import kh.petmily.dao.MemberDao;
import kh.petmily.dao.VolunteerDao;
import kh.petmily.domain.abandoned_animal.form.VolunteerApplySubmitForm;
import kh.petmily.domain.volunteer.VolunteerApply;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class VolunteerServiceImpl implements VolunteerService {

    private final AbandonedAnimalDao abandonedAnimalDao;
    private final VolunteerDao volunteerDao;
    private final MemberDao memberDao;

    @Override
    public int findsNumber(int abNumber) {
        int sNumber = abandonedAnimalDao.selectsNumber(abNumber);

        return sNumber;
    }

    @Override
    public void volunteer(VolunteerApplySubmitForm volunteerApplySubmitForm) {
        VolunteerApply volunteerApply = toVolunteerApply(volunteerApplySubmitForm);
        log.info("volunteerApply = {}", volunteerApply);

        volunteerDao.insert(volunteerApply);
    }

    @Override
    public String findAnimalName(int pk) {
        String animalName = abandonedAnimalDao.selectName(pk);

        return animalName;
    }

    @Override
    public String findMemberName(int pk) {
        String memberName = memberDao.selectName(pk);

        return memberName;
    }

    @Override
    public String findMemberBirth(int pk) {
        String memberBirth = memberDao.selectBirth(pk);

        return memberBirth;
    }

    @Override
    public String findMemberPhone(int pk) {
        String memberPhone = memberDao.selectPhone(pk);

        return memberPhone;
    }

    @Override
    public String findMemberEmail(int pk) {
        String memberEmail = memberDao.selectEmail(pk);

        return memberEmail;
    }

    private VolunteerApply toVolunteerApply(VolunteerApplySubmitForm volunteerApplySubmitForm) {
        VolunteerApply volunteerApply = new VolunteerApply(
                volunteerApplySubmitForm.getMNumber(),
                volunteerApplySubmitForm.getVolunteerStartDay(),
                volunteerApplySubmitForm.getVolunteerPeriod(),
                volunteerApplySubmitForm.getSNumber()
        );

        return volunteerApply;
    }

}
