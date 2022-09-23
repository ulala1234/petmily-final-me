package kh.petmily.domain.volunteer;

import kh.petmily.domain.DomainObj;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Getter
@NoArgsConstructor
public class VolunteerApply implements DomainObj {

    private int vaNumber;
    private int mNumber;
    private Date volunteerStartDay;
    private int volunteerPeriod;
    private int sNumber;

    public VolunteerApply(int mNumber, Date volunteerStartDay, int volunteerPeriod, int sNumber) {
        this.mNumber = mNumber;
        this.volunteerStartDay = volunteerStartDay;
        this.volunteerPeriod = volunteerPeriod;
        this.sNumber = sNumber;
    }
}
