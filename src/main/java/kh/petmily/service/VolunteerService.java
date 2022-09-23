package kh.petmily.service;

import kh.petmily.domain.abandoned_animal.form.VolunteerApplySubmitForm;

public interface VolunteerService {

    public int findsNumber(int abNumber);

    public void volunteer(VolunteerApplySubmitForm volunteerApplySubmitForm);

    public String findAnimalName(int pk);

    public String findMemberName(int pk);

    public String findMemberBirth(int pk);

    public String findMemberPhone(int pk);

    public String findMemberEmail(int pk);
}
