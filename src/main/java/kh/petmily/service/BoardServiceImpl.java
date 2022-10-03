package kh.petmily.service;

import kh.petmily.dao.BoardDao;
import kh.petmily.dao.MemberDao;
import kh.petmily.domain.admin.form.AdminBoardListForm;
import kh.petmily.domain.board.Board;
import kh.petmily.domain.board.form.BoardModifyForm;
import kh.petmily.domain.board.form.BoardPage;
import kh.petmily.domain.board.form.ReadBoardForm;
import kh.petmily.domain.board.form.WriteBoardForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardServiceImpl implements BoardService {

    private final BoardDao boardDao;
    private final MemberDao memberDao;
    private int size = 5;

    @Override
    public BoardPage getBoardPage(int pageNum, String kindOfBoard, String sort) {
        int total = boardDao.selectCount(kindOfBoard);
        List<ReadBoardForm> content = boardDao.selectIndex((pageNum - 1) * size + 1, (pageNum - 1) * size + size, kindOfBoard, sort);

        return new BoardPage(total, pageNum, size, content);
    }

    @Override
    public void write(WriteBoardForm writeBoardForm) {
        Board board = toBoard(writeBoardForm);
        boardDao.insert(board);
    }

    @Override
    public ReadBoardForm getBoard(int bNumber) {
        boardDao.updateViewCount(bNumber);
        Board readBoardForm = boardDao.findByPk(bNumber);

        String memberName = memberDao.selectName(readBoardForm.getMNumber());
        readBoardForm.setName(memberName);

        return new ReadBoardForm(
                readBoardForm.getBNumber(),
                readBoardForm.getMNumber(),
                readBoardForm.getName(),
                readBoardForm.getKindOfBoard(),
                readBoardForm.getTitle(),
                readBoardForm.getContent(),
                readBoardForm.getWrTime(),
                readBoardForm.getCheckPublic(),
                readBoardForm.getViewCount(),
                readBoardForm.getReplyCount(),
                readBoardForm.getSort()
        );
    }

    @Override
    public BoardModifyForm getBoardModify(int bNumber) {
        Board board = boardDao.findByPk(bNumber);
        BoardModifyForm modReq = toBoardModify(board);
        return modReq;
    }

    @Override
    public void modify(BoardModifyForm modReq) {
        Board board = toBoardModifyForm(modReq);
        boardDao.update(board);
    }

    @Override
    public void delete(int bNumber) {
        boardDao.delete(bNumber);
    }

    @Override
    public List<AdminBoardListForm> selectAll(String kindOfBoard) {
        List<AdminBoardListForm> list = new ArrayList<>();

        List<Board> boardList = boardDao.selectAll(kindOfBoard);

        for (Board b : boardList) {
            AdminBoardListForm ad = new AdminBoardListForm(b.getBNumber(), findName(b.getMNumber()), b.getWrTime(), b.getTitle());
            list.add(ad);
        }

        return list;
    }

    @Override
    public String findName(int mNumber) {
        return memberDao.selectName(mNumber);
    }

    private Board toBoard(WriteBoardForm req) {
        return new Board(
                req.getMNumber(),
                req.getKindOfBoard(),
                req.getTitle(),
                req.getContent(),
                req.getCheckPublic());
    }

    private Board toBoardModifyForm(BoardModifyForm modReq) {
        return new Board(modReq.getBNumber(), modReq.getTitle(), modReq.getContent(), modReq.getCheckPublic());
    }

    private BoardModifyForm toBoardModify(Board board) {
        return new BoardModifyForm(board.getBNumber(), board.getTitle(), board.getContent(), board.getCheckPublic());
    }
}