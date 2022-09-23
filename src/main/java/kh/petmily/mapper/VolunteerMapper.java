package kh.petmily.mapper;

import kh.petmily.domain.volunteer.VolunteerApply;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VolunteerMapper {

    // =======BasicMapper 메소드=======
    VolunteerApply selectByPk(int pk);

    void insert(VolunteerApply obj);

    void update(VolunteerApply obj);

    void delete(int pk);
    // =======BasicMapper 메소드=======
}
