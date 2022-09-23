package kh.petmily.mapper;

import kh.petmily.domain.member.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {

    // =======BasicMapper 메소드=======
    Member selectByPk(int pk);

    void insert(Member member);

    void update(Member member);

    void delete(int pk);
    // =======BasicMapper 메소드=======

    int selectmNumber(@Param("id") String id, @Param("pw") String pw);

    Member selectMemberById(String id);

    String selectName(int pk);

    String selectBirth(int pk);

    String selectPhone(int pk);

    String selectEmail(int pk);

    int selectCount();

    List<Member> selectIndex(@Param("start") int start, @Param("end") int end);

    String selectMemberId(int pk);

    List<Member> selectAll();
}