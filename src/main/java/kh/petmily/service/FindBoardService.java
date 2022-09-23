package kh.petmily.service;

import kh.petmily.domain.admin.form.AdminBoardListForm;
import kh.petmily.domain.find_board.FindBoard;
import kh.petmily.domain.find_board.form.FindBoardDetailForm;
import kh.petmily.domain.find_board.form.FindBoardModifyForm;
import kh.petmily.domain.find_board.form.FindBoardPageForm;
import kh.petmily.domain.find_board.form.FindBoardWriteForm;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface FindBoardService {

    public void write(FindBoardWriteForm fwForm);

    public void modify(FindBoardModifyForm fmForm);

    public void delete(int faNumber);

    public FindBoardDetailForm getDetailForm(int faNumber);

    public FindBoardModifyForm getModifyForm(int faNumber);

    public FindBoardPageForm getFindPage(int pageNo, String animalType, String stateType, String keyword);

    public FindBoardPageForm getMembersFindPage(int pageNo, int mNumber, String matched);

    String findName(int faNumber);

    public int updateViewCount(int faNumber);

    public FindBoard getFindBoard(int faNumber);

    public String storeFile(MultipartFile file, String filePath) throws IOException;

    public List<AdminBoardListForm> selectAll();
}