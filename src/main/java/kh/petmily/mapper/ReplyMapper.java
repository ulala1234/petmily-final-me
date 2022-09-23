package kh.petmily.mapper;

import kh.petmily.domain.reply.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {

    Reply selectByPk(int pk);

    void insert(Reply obj);

    void update(Reply obj);

    void delete(int pk);

    List<Reply> getList(int bNumber);
}