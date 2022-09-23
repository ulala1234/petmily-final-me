package kh.petmily.dao;

import kh.petmily.domain.DomainObj;
import kh.petmily.domain.donation.Donation;
import kh.petmily.domain.donation.form.DonationDetailForm;
import kh.petmily.domain.donation.form.DonationListForm;
import kh.petmily.mapper.AbandonedAnimalMapper;
import kh.petmily.mapper.DonationMapper;
import kh.petmily.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class DonationDao implements BasicDao {

    private final DonationMapper mapper;
    private final AbandonedAnimalMapper abandonedAnimalMapper;
    private final MemberMapper memberMapper;

    // =======BasicDao 메소드=======
    @Override
    public Donation findByPk(int pk) {
        return mapper.selectByPk(pk);
    }

    @Override
    public void insert(DomainObj obj) {
        mapper.insert((Donation) obj);
    }

    @Override
    public void update(DomainObj obj) {
        mapper.update((Donation) obj);
    }

    @Override
    public void delete(int pk) {
        mapper.delete(pk);
    }
    // =======BasicDao 메소드=======

    public int selectCount() {
        return mapper.selectCount();
    }

    public List<DonationDetailForm> selectIndex(int start, int end) {
        List<DonationListForm> donationListForms = mapper.selectIndex(start, end);
        List<DonationDetailForm> result = new ArrayList<>();

        for (DonationListForm d : donationListForms) {
            DonationDetailForm df = new DonationDetailForm(d.getDNumber(),
                    d.getAbNumber(), findAnimalName(d.getAbNumber()),
                    d.getMNumber(), findMemberName(d.getMNumber()),
                    d.getDonaSum(),
                    d.getBank(), d.getAccountHolder(), d.getAccountNumber());
            result.add(df);
        }

        return result;
    }

    private String findAnimalName(int abNumber) {
        return abandonedAnimalMapper.selectName(abNumber);
    }

    private String findMemberName(int mNumber) {
        return memberMapper.selectName(mNumber);
    }
}
