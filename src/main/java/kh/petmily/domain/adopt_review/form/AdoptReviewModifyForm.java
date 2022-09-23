package kh.petmily.domain.adopt_review.form;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
public class AdoptReviewModifyForm {

    private int bNumber;
    private int mNumber;
    private String title;
    private String content;
    private String checkPublic;
    private String fullPath;
    private MultipartFile imgPath;

    public AdoptReviewModifyForm(int bNumber, int mNumber, String title, String content, MultipartFile imgPath, String checkPublic) {
        this.bNumber = bNumber;
        this.mNumber = mNumber;
        this.title = title;
        this.content = content;
        this.imgPath = imgPath;
        this.checkPublic = checkPublic;
    }

    public AdoptReviewModifyForm(int bNumber, String title, String content, String checkPublic1) {
        this.bNumber = bNumber;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
    }
}