package kh.petmily.mapper;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberMapperTest {

    @Autowired MemberMapper mapper;

    @Test
    void test_selectName() {
        String s = mapper.selectName(291);

        Assertions.assertThat(s).isEqualTo("gggg");
    }
}