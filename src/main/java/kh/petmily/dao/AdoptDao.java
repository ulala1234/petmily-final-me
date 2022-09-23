package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.adopt.Adopt;
import kh.petmily.domain.adopt.form.AdoptDetailForm;
import kh.petmily.domain.adopt.form.AdoptMemberApplyListForm;
import kh.petmily.domain.adopt.form.AdoptTempListForm;
import kh.petmily.mapper.AbandonedAnimalMapper;
import kh.petmily.mapper.AdoptMapper;
import kh.petmily.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdoptDao implements BasicDao {

    private final AdoptMapper mapper;
    private final AbandonedAnimalMapper abandonedAnimalMapper;
    private final MemberMapper memberMapper;

    @Override
    public Adopt findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((Adopt) obj);
    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((Adopt) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }

    public int selectCount(int mNumber) {
        return mapper.selectCountBymNumber(mNumber);
    }

    public List<AdoptMemberApplyListForm> selectIndex(int start, int end, int mNumber) {
        List<Adopt> list = mapper.selectIndexBymNumber(start, end, mNumber);
        List<AdoptMemberApplyListForm> maList = new ArrayList<>();

        for (Adopt a : list) {
            AdoptMemberApplyListForm ma = new AdoptMemberApplyListForm(a.getAdNumber(), getAbNameByAbNumber(a.getAbNumber()), a.getStatus());
            maList.add(ma);
        }

        return maList;
    }

    private String getAbNameByAbNumber(int abNumber) {
        return abandonedAnimalMapper.selectName(abNumber);
    }

    public int selectCount() {
        return mapper.selectCount();
    }

    public List<AdoptDetailForm> selectIndex(int start, int end, String status) {

        List<AdoptDetailForm> adopts = new ArrayList<>();
        List<AdoptTempListForm> adoptList = mapper.selectIndexByStatus(start, end, status);

        for (AdoptTempListForm l : adoptList) {
            AdoptDetailForm li = new AdoptDetailForm(
                    l.getAdNumber(), l.getMNumber(), l.getAbNumber(),
                    l.getResidence(), l.getMaritalStatus(), l.getJob(), l.getStatus(), selectAnimalName(l.getAbNumber()),
                    selectMemberName(l.getMNumber()), selectMemberId(l.getMNumber())
            );

            adopts.add(li);
        }
        return adopts;
    }

    public List<AdoptDetailForm> adoptApprove(int pk) {
        List<AdoptDetailForm> adopts = new ArrayList<>();
        List<AdoptTempListForm> adoptList = mapper.adoptApprove(pk);

        for (AdoptTempListForm l : adoptList) {
            AdoptDetailForm li = new AdoptDetailForm(
                    l.getAdNumber(), l.getMNumber(), l.getAbNumber(),
                    l.getResidence(), l.getMaritalStatus(), l.getJob(), l.getStatus(), selectAnimalName(l.getAbNumber()),
                    selectMemberName(l.getMNumber()), selectMemberId(l.getMNumber())
            );

            adopts.add(li);
        }
        return adopts;
    }

    public List<AdoptDetailForm> adoptRefuse(int pk) {
        List<AdoptDetailForm> adopts = new ArrayList<>();
        List<AdoptTempListForm> adoptList = mapper.adoptRefuse(pk);

        for (AdoptTempListForm l : adoptList) {
            AdoptDetailForm li = new AdoptDetailForm(
                    l.getAdNumber(), l.getMNumber(), l.getAbNumber(),
                    l.getResidence(), l.getMaritalStatus(), l.getJob(), l.getStatus(), selectAnimalName(l.getAbNumber()),
                    selectMemberName(l.getMNumber()), selectMemberId(l.getMNumber())
            );

            adopts.add(li);
        }
        return adopts;
    }

    public String selectAnimalName(int abNumber) {
        return abandonedAnimalMapper.selectName(abNumber);
    }

    public String selectMemberName(int mNumber) {
        return memberMapper.selectName(mNumber);
    }

    public String selectMemberId(int mNumber) {
        return memberMapper.selectMemberId(mNumber);
    }
}
