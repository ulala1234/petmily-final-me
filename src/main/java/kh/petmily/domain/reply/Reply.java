package kh.petmily.domain.reply;

import kh.petmily.domain.DomainObj;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Getter
@NoArgsConstructor
public class Reply implements DomainObj {
    private int brNumber;
    private int bNumber;
    private int mNumber;
    private String reply;
    private Date wrTime;

    public Reply(int bNumber, int mNumber, String reply) {
        this.bNumber = bNumber;
        this.mNumber = mNumber;
        this.reply = reply;
    }

    public Reply(int brNumber, String reply) {
        this.brNumber = brNumber;
        this.reply = reply;
    }
}