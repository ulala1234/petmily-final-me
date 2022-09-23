package kh.petmily.domain.member.form;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberChangeForm {
    private int mNumber;
    private String pw;
    private String name;
    private String email;
    private String phone;

    public MemberChangeForm(String pw, String name, String email, String phone) {
        this.pw = pw;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }
}