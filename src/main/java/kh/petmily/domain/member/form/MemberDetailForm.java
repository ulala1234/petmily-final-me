package kh.petmily.domain.member.form;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
public class MemberDetailForm {
    private int mNumber;
    private String id;
    private String pw;
    private String name;
    private Date birth;
    private String gender;
    private String email;
    private String phone;
    private String grade;

    /*생성자*/
    public MemberDetailForm(int mNumber, String id, String pw, String name, Date birth, String gender, String email, String phone, String grade) {
        this.mNumber = mNumber;
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.birth = birth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.grade = grade;
    }

    // by 은지, 221027, 봉사 신청서에서 회원 정보 받는 생성자
    public MemberDetailForm(String name, Date birth, String email, String phone) {
        this.name = name;
        this.birth = birth;
        this.email = email;
        this.phone = phone;
    }
}
