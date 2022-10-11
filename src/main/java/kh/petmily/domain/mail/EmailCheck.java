package kh.petmily.domain.mail;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class EmailCheck {
    String address;
    String code;
    int is_Auth;
}
