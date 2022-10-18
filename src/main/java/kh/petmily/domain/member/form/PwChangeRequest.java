package kh.petmily.domain.member.form;

import lombok.Data;

@Data
public class PwChangeRequest {
    private String id;
    private String pw;
    private String confirmPw;
    private String email;
}

