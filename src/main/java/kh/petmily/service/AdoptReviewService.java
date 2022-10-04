package kh.petmily.service;

import kh.petmily.domain.admin.form.AdminBoardListForm;
import kh.petmily.domain.adopt_review.form.AdoptReviewForm;
import kh.petmily.domain.adopt_review.form.AdoptReviewModifyForm;
import kh.petmily.domain.adopt_review.form.AdoptReviewWriteForm;
import kh.petmily.domain.adopt_review.form.BoardPage;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface AdoptReviewService {

    public BoardPage getAdoptReviewPage(int pbNumber, String kindOfBoard, String searchType, String keyword);

    public AdoptReviewForm getAdoptReview(int bNumber);

    public void write(AdoptReviewWriteForm adoptReviewWriteForm);

    public AdoptReviewModifyForm getAdoptReviewModify(int bNumber);

    public void modify(AdoptReviewModifyForm modReq);

    public void delete(int bNumber);

    public String boardName(int bNumber);

    public String storeFile(MultipartFile file, String filePath) throws IOException;

    public List<AdminBoardListForm> selectAll(String kindOfBoard);

    public String findName(int mNumber);
}