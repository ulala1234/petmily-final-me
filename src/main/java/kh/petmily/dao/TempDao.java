package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.adopt.form.AdoptTempListForm;
import kh.petmily.domain.adopt.form.TempDetailForm;
import kh.petmily.domain.temp.TempPet;
import kh.petmily.domain.temp.form.TempMemberApplyListForm;
import kh.petmily.mapper.AbandonedAnimalMapper;
import kh.petmily.mapper.MemberMapper;
import kh.petmily.mapper.TempMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class TempDao implements BasicDao {

    private final TempMapper mapper;
    private final AbandonedAnimalMapper abandonedAnimalMapper;
    private final MemberMapper memberMapper;

    @Override
    public TempPet findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((TempPet) obj);
    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((TempPet) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }

    public int selectCount(int mNumber) {
        return mapper.selectCountBymNumber(mNumber);
    }

    public List<TempMemberApplyListForm> selectIndex(int start, int end, int mNumber) {
        List<TempPet> list = mapper.selectIndexBymNumber(start, end, mNumber);
        List<TempMemberApplyListForm> maList = new ArrayList<>();

        for (TempPet t : list) {
            TempMemberApplyListForm ma = new TempMemberApplyListForm(t.getTNumber(), getAbNameByAbNumber(t.getAbNumber()), t.getStatus());
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

    public List<TempDetailForm> selectIndex(int start, int end, String status) {

        List<TempDetailForm> temps = new ArrayList<>();
        List<AdoptTempListForm> tempList = mapper.selectIndexByStatus(start, end, status);

        for (AdoptTempListForm l : tempList) {
            TempDetailForm li = new TempDetailForm(
                    l.getTNumber(), l.getMNumber(), l.getAbNumber(),
                    l.getResidence(), l.getMaritalStatus(), l.getJob(), l.getStatus(), selectAnimalName(l.getAbNumber()),
                    selectMemberName(l.getMNumber()), selectMemberId(l.getMNumber())
            );

            temps.add(li);
        }
        return temps;
    }

    public List<TempDetailForm> tempApprove(int pk) {
        List<TempDetailForm> temps = new ArrayList<>();
        List<AdoptTempListForm> tempList = mapper.tempApprove(pk);

        for (AdoptTempListForm l : tempList) {
            TempDetailForm li = new TempDetailForm(
                    l.getTNumber(), l.getMNumber(), l.getAbNumber(),
                    l.getResidence(), l.getMaritalStatus(), l.getJob(), l.getStatus(), selectAnimalName(l.getAbNumber()),
                    selectMemberName(l.getMNumber()), selectMemberId(l.getMNumber())
            );

            temps.add(li);
        }
        return temps;
    }

    public List<TempDetailForm> tempRefuse(int pk) {
        List<TempDetailForm> temps = new ArrayList<>();
        List<AdoptTempListForm> tempList = mapper.tempRefuse(pk);

        for (AdoptTempListForm l : tempList) {
            TempDetailForm li = new TempDetailForm(
                    l.getTNumber(), l.getMNumber(), l.getAbNumber(),
                    l.getResidence(), l.getMaritalStatus(), l.getJob(), l.getStatus(), selectAnimalName(l.getAbNumber()),
                    selectMemberName(l.getMNumber()), selectMemberId(l.getMNumber())
            );

            temps.add(li);
        }
        return temps;
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
