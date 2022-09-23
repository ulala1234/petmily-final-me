package kh.petmily.domain.admin.form;

import lombok.Data;

import java.sql.Date;

@Data
public class AdminBoardListForm {
    private int pk;
    private String name;
    private Date wrTime;
    private String title;

    public AdminBoardListForm(int pk, String name, Date wrTime, String title) {
        this.pk = pk;
        this.name = name;
        this.wrTime = wrTime;
        this.title = title;
    }
}