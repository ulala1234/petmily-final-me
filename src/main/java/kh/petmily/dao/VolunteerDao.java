package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.volunteer.VolunteerApply;
import kh.petmily.mapper.VolunteerMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class VolunteerDao implements BasicDao {

    private final VolunteerMapper mapper;

    // =======BasicDao 메소드=======
    @Override
    public VolunteerApply findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((VolunteerApply) obj);
    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((VolunteerApply) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }
    // =======BasicDao 메소드=======
}
