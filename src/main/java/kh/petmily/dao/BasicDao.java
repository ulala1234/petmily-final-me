package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import org.springframework.stereotype.Repository;

@Repository
public interface BasicDao {

    public DomainObj findByPk(int pk);

    public void insert(DomainObj obj);

    public void update(DomainObj obj);

    public void delete(int pk);
}
