package kh.petmily.service;

import kh.petmily.domain.admin.form.AdminBoardListForm;
import kh.petmily.domain.board.form.BoardModifyForm;
import kh.petmily.domain.board.form.BoardPage;
import kh.petmily.domain.board.form.ReadBoardForm;
import kh.petmily.domain.board.form.WriteBoardForm;

import java.util.List;

public interface BoardService {

    public BoardPage getBoardPage(int pbNumber, String kindOfBoard, String sort);

    public void write(WriteBoardForm writeBoardForm);

    public ReadBoardForm getBoard(int bNumber);

    public BoardModifyForm getBoardModify(int bNumber);

    public void modify(BoardModifyForm modReq);

    public void delete(int bNumber);

    public List<AdminBoardListForm> selectAll(String kindOfBoard);

    public String findName(int mNumber);
}