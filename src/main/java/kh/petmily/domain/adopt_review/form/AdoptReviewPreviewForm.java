package kh.petmily.domain.adopt_review.form;

import lombok.Data;

import java.sql.Date;

@Data
public class AdoptReviewPreviewForm {
    private int bNumber;
    private String name;
    private Date wrTime;
    private String title;
    private String imgPath;

    public AdoptReviewPreviewForm(int bNumber, String name, Date wrTime, String title, String imgPath) {
        this.bNumber = bNumber;
        this.name = name;
        this.wrTime = wrTime;
        this.title = title;
        this.imgPath = imgPath;
    }
}