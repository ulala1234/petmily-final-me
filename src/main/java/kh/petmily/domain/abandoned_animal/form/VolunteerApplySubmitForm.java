package kh.petmily.domain.abandoned_animal.form;

import lombok.Data;

import java.sql.Date;

@Data
public class VolunteerApplySubmitForm {

    // 신청서폼
    private int vaNumber;
    private int mNumber;
    private Date volunteerStartDay;
    private int volunteerPeriod;
    private int sNumber;

    public VolunteerApplySubmitForm(Date volunteerStartDay, int volunteerPeriod) {
        this.volunteerStartDay = volunteerStartDay;
        this.volunteerPeriod = volunteerPeriod;
    }
}
