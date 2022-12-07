package kh.petmily.mapper;

import kh.petmily.domain.abandoned_animal.AbandonedAnimal;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.assertj.core.api.Assertions.*;

@SpringBootTest
class AbandonedAnimalMapperTest {

    @Autowired
    AbandonedAnimalMapper mapper;

    @Test
    void test_selectOneAnimal() {
        AbandonedAnimal findAbandonedAnimal = mapper.selectByPk(7);

//        Assertions.assertEquals(findAbandonedAnimal.getName(), "a1");
        assertThat(findAbandonedAnimal.getName()).isEqualTo("a1");
    }

    @Test
    void test_selectCount() {
        int count = mapper.selectCount();

        assertThat(count).isEqualTo(14);
    }

    @Test
    void test_selectIndex() {
        List<AbandonedAnimal> abandonedAnimals = mapper.selectIndex(3, 7);

        for (AbandonedAnimal abandonedAnimal : abandonedAnimals) {
            System.out.println("abandonedAnimal.getName() = " + abandonedAnimal.getName());
        }
    }

    @Test
    void test_selectName() {
        String s = mapper.selectName(44);
        
        assertThat(s).isEqualTo("먼지");
    }
}