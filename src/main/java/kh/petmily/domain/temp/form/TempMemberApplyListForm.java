package kh.petmily.domain.temp.form;

import lombok.Data;

@Data
public class TempMemberApplyListForm {
    int pk;
    String abName;
    String status;

    public TempMemberApplyListForm(int tNumber, String abName, String status) {
        this.pk = tNumber;
        this.abName = abName;
        this.status = status;
    }
}