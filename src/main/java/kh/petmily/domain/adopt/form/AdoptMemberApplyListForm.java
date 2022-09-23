package kh.petmily.domain.adopt.form;

import lombok.Data;

@Data
public class AdoptMemberApplyListForm {
    int pk;
    String abName;
    String status;

    public AdoptMemberApplyListForm(int adNumber, String abName, String status) {
        this.pk = adNumber;
        this.abName = abName;
        this.status = status;
    }
}