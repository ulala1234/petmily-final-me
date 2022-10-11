package kh.petmily.mapper;

import kh.petmily.domain.mail.EmailCheck;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmailMapper {
    EmailCheck getEmailCheck(String address);

    int getCount(String address);

    int insertMailAuth(@Param("address")String address, @Param("code")String code);

    String getCodeByEmail(String address);

    int updateEmailCheck(@Param("address")String address, @Param("code")String code);

    void completeCheck(String address);
}
