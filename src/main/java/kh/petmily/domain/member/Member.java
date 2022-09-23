package kh.petmily.domain.member;

import kh.petmily.domain.DomainObj;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Date;

@Data
@NoArgsConstructor
@ToString
public class Member implements DomainObj {
    private int mNumber;
    private String id;
    private String pw;
    private String name;
    private Date birth;
    private String gender;
    private String email;
    private String phone;
    private String grade;

    public Member(int mNumber, String id, String pw, String name, Date birth, String gender, String email, String phone, String grade) {
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

    public Member(String id, String pw, String name, Date birth, String gender, String email, String phone) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.birth = birth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
    }

    public Member(int mNumber, String pw, String name, String phone, String email) {
        this.mNumber = mNumber;
        this.pw = pw;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public Member(String pw, String name, String email, String phone, String id) {
        this.pw = pw;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.id = id;
    }

    public boolean matchPw(String pwd) {
        return pw.equals(pwd);
    }

    public void toInfoInsertMNumber(int mNumber) {
        this.mNumber = mNumber;
    }
}
