package kh.petmily.dao;

import kh.petmily.domain.mail.EmailCheck;
import kh.petmily.mapper.EmailMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class EmailDao{
    private final EmailMapper mapper;

    public int insertMailAuth(@Param("address") String address, @Param("code") String code) {
        return mapper.insertMailAuth(address, code);
    }

    public EmailCheck getEmailCheck(String address) {
        return mapper.getEmailCheck(address);
    }

    public int updateEmailCheck(@Param("address") String address, @Param("code") String code) {
        return mapper.updateEmailCheck(address, code);
    }

    public void completeCheck(String address) {
        mapper.completeCheck(address);
    }

    public String getCodeByEmail(String address) {
        return mapper.getCodeByEmail(address);
    }

    public int getCount(String address) {
        return mapper.getCount(address);
    }
}
