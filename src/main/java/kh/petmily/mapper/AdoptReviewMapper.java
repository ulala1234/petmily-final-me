package kh.petmily.mapper;

import kh.petmily.domain.adopt_review.AdoptReview;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdoptReviewMapper {

    // =======BasicMapper 메소드=======
    AdoptReview selectByPk(int pk);

    void insert(AdoptReview board);

    void update(AdoptReview board);

    void delete(int pk);
    // =======BasicMapper 메소드=======

    //====== 검색 추가 ======
    int selectCountWithCondition(@Param("kindOfBoard") String kindOfBoard, @Param("searchType") String searchType, @Param("keyword") String keyword);

    //====== 검색 추가 ======
    List<AdoptReview> selectIndexWithCondition(@Param("start") int start, @Param("end") int end, @Param("kindOfBoard") String kindOfBoard, @Param("searchType") String searchType, @Param("keyword") String keyword);

    String selectName(int pk);

    // ====== 조회수 추가 ======
    int updateViewCount(int pk);

    List<AdoptReview> selectAll(String kindOfBoard);
}