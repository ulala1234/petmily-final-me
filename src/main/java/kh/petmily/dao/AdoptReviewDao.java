package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.adopt_review.AdoptReview;
import kh.petmily.domain.adopt_review.form.AdoptReviewForm;
import kh.petmily.mapper.AdoptReviewMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdoptReviewDao implements BasicDao {

    private final AdoptReviewMapper mapper;

    // =======BasicDao 메소드=======
    @Override
    public AdoptReview findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((AdoptReview) obj);
    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((AdoptReview) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }
    // =======BasicDao 메소드=======

    //====== 검색 추가 ======
    public int selectCount(String kindOfBoard, String searchType, String keyword) {
        return mapper.selectCountWithCondition(kindOfBoard, searchType, keyword);
    }

    public List<AdoptReviewForm> selectIndex(int start, int end, String kindOfBoard, String searchType, String keyword) {
        List<AdoptReview> list = mapper.selectIndexWithCondition(start, end, kindOfBoard, searchType, keyword);
        List<AdoptReviewForm> adoptReviewFormList = new ArrayList<>();

        for (AdoptReview a : list) {
            AdoptReviewForm ar = new AdoptReviewForm(
                    a.getBNumber(),
                    a.getMNumber(),
                    selectName(a.getBNumber()),
                    a.getKindOfBoard(),
                    a.getTitle(),
                    a.getContent(),
                    a.getImgPath(),
                    a.getWrTime(),
                    a.getCheckPublic(),
                    a.getViewCount(),
                    a.getReplyCount());

            adoptReviewFormList.add(ar);
        }

        return adoptReviewFormList;
    }

    public String selectName(int pk) {
        return mapper.selectName(pk);
    }

    //====== 조회수 추가 ======
    public int updateViewCount(int pk) {
        return mapper.updateViewCount(pk);
    }

    public List<AdoptReview> selectAll(String kindOfBoard) {
        return mapper.selectAll(kindOfBoard);
    }
}