package kh.petmily.mapper;

import kh.petmily.domain.look_board.LookBoard;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class LookBoardMapperTest {

    @Autowired LookBoardMapper mapper;

    @Test
    void count_with_condition() {
        int result1 = mapper.selectCountWithCondition("allSpecies", "allAnimalState", "allKeyword");
        int result2 = mapper.selectCountWithCondition("개", "보호", "weg");

        System.out.println("result1 = " + result1);
        System.out.println("result2 = " + result2);
    }

    @Test
    void 조건부_검색() {
        List<LookBoard> lookBoards = mapper.selectIndexWithCondition(1, 3, "allSpecies", "보호", "weg");

        for (LookBoard lookBoard : lookBoards) {
            System.out.println("lookBoard = " + lookBoard);
        }
    }
}