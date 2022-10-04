package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.board.Board;
import kh.petmily.domain.board.form.ReadBoardForm;
import kh.petmily.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class BoardDao implements BasicDao {

    private final BoardMapper mapper;

    // =======BasicDao 메소드=======
    @Override
    public Board findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((Board) obj);
    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((Board) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }
    // =======BasicDao 메소드=======

    public int selectCount(String kindOfBoard) {
        return mapper.selectCount(kindOfBoard);
    }

    public List<ReadBoardForm> selectIndex(int start, int end, String kindOfBoard, String sort) {
        List<Board> list = mapper.selectIndex(start, end, kindOfBoard, sort);
        List<ReadBoardForm> readBoardFormList = new ArrayList<>();

        for (Board b : list) {
            ReadBoardForm bd = new ReadBoardForm(b.getBNumber(), b.getMNumber(), selectName(b.getBNumber()), b.getKindOfBoard(), b.getTitle(), b.getContent(), b.getWrTime(), b.getCheckPublic(), b.getViewCount(), b.getReplyCount(), b.getSort());
            readBoardFormList.add(bd);
        }

        return readBoardFormList;
    }

    public String selectName(int pk) {
        return mapper.selectName(pk);
    }

    public int updateViewCount(int pk) {
        return mapper.updateViewCount(pk);
    }

    public int updateReplyCount(int pk, int amount) {
        return mapper.updateReplyCount(pk, amount);
    }

    public List<Board> selectAll(String kindOfBoard) {
        return mapper.selectAll(kindOfBoard);
    }
}