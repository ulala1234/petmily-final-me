package kh.petmily.mapper;

import kh.petmily.domain.adopt_review.AdoptReview;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class AdoptReviewMapperTest {

    @Autowired
    AdoptReviewMapper mapper;

    @Test
    void count_with_condition() {
        int result1 = mapper.selectCountWithCondition("입양후기", "allSearch", "산책");
        int result2 = mapper.selectCountWithCondition("입양후기", "allSearch", "");
        int result3 = mapper.selectCountWithCondition("입양후기", "name", "aaa");

        System.out.println("result1 = " + result1);
        System.out.println("result2 = " + result2);
        System.out.println("result3 = " + result3);
    }

    @Test
    void select_with_condition() {
        List<AdoptReview> adoptReviewList1 = mapper.selectIndexWithCondition(1, 2, "입양후기", "name", "aaa");
        List<AdoptReview> adoptReviewList2 = mapper.selectIndexWithCondition(1, 2, "입양후기", "allSearch", "");

        for (AdoptReview adoptReview1 : adoptReviewList1) {
            System.out.println("adoptReview1 = " + adoptReview1);
        }

        for (AdoptReview adoptReview2 : adoptReviewList2) {
            System.out.println("adoptReview2 = " + adoptReview2);
        }
    }
}
