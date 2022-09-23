package kh.petmily.domain.adopt_review.form;

import kh.petmily.domain.DomainObj;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
public class AdoptReviewWriteForm implements DomainObj {
    private int mNumber;
    private String kindOfBoard;
    private String title;
    private String content;
    private String checkPublic;
    private String fullPath;
    private MultipartFile imgPath;

    public AdoptReviewWriteForm(int mNumber, String kindOfBoard, String title, String content, String checkPublic) {
        this.mNumber = mNumber;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
        this.imgPath = imgPath;
    }

    public AdoptReviewWriteForm(int mNumber, String kindOfBoard, String title, String content, String checkPublic, String fullPath, MultipartFile imgPath) {
        this.mNumber = mNumber;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
        this.fullPath = fullPath;
        this.imgPath = imgPath;
    }

    public AdoptReviewWriteForm(int mNumber, String kindOfBoard, String title, String content, MultipartFile imgPath, String checkPublic) {
        this.mNumber = mNumber;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.imgPath = imgPath;
        this.checkPublic = checkPublic;
    }

    public int getmNumber() {
        return mNumber;
    }

    public void setmNumber(int mNumber) {
        this.mNumber = mNumber;
    }
}