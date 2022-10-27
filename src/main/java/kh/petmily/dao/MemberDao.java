package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.member.Member;
import kh.petmily.domain.member.form.MemberDetailForm;
import kh.petmily.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MemberDao implements BasicDao {

    private final MemberMapper mapper;

    // =======BasicDao 메소드=======
    @Override
    public Member findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((Member) obj);
    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((Member) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }

    // =======BasicDao 메소드=======
    public int memberCheck(String email, String id) {
        return mapper.memberCheck(email, id);
    }

    public void pwChange(Member member) {
        mapper.pwChange(member);
    }

    public Member selectMemberById(String id) {
        return mapper.selectMemberById(id);
    }

    public String selectName(int pk) {
        return mapper.selectName(pk);
    }

    public List<Member> selectAll() {
        return mapper.selectAll();
    }

    public int selectCount() {
        return mapper.selectCount();
    }

    public List<MemberDetailForm> selectIndex(int start, int end) {
        List<Member> memberListForms = mapper.selectIndex(start, end);
        List<MemberDetailForm> result = new ArrayList<>();

        for (Member m : memberListForms) {
            MemberDetailForm mf = new MemberDetailForm(m.getMNumber(), m.getId(), m.getPw(), m.getName(), m.getBirth(), m.getGender(), m.getEmail(), m.getPhone(), m.getGrade());
            result.add(mf);
        }

        return result;
    }
}