package kh.petmily.domain.mail.form;

import lombok.Data;

@Data
public class EmailCodeRequest {
    public String address;
    public String code;
}
