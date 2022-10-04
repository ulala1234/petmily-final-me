package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.reply.Reply;
import kh.petmily.mapper.ReplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ReplyDao implements BasicDao {
    private final ReplyMapper mapper;

    @Override
    public Reply findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((Reply) obj);

    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((Reply) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }

    public List<Reply> list(int bNumber) {
        List<Reply> list = mapper.getList(bNumber);

        return list;
    }

    public int selectCount(int bNumber) {
        return mapper.selectCount(bNumber);
    }

    public int getBNumber(int pk) {
        return mapper.getBNumber(pk);
    }
}