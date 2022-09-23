package kh.petmily.mapper;

import kh.petmily.domain.board.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {

    // =======BasicMapper 메소드=======
    Board selectByPk(int pk);

    void insert(Board board);

    void update(Board board);

    void delete(int pk);
    // =======BasicMapper 메소드=======

    int selectCount(String kindOfBoard);

    List<Board> selectIndex(@Param("start") int start, @Param("end") int end, @Param("kindOfBoard") String kindOfBoard, @Param("sort") String sort);

    //Board selectWriteBoardForm(int pk);

    String selectName(int pk);

    int updateViewCount(int pk);

    List<Board> selectAll(String kindOfBoard);
}