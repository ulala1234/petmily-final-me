package kh.petmily.service;

import kh.petmily.domain.abandoned_animal.form.VolunteerApplySubmitForm;

public interface VolunteerService {

    public int findsNumber(int abNumber);

    public void volunteer(VolunteerApplySubmitForm volunteerApplySubmitForm);
}
