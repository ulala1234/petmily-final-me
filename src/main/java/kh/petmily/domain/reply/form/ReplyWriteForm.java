package kh.petmily.domain.reply.form;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReplyWriteForm {
    private int bNumber;
    private int mNumber;
    private String reply;

    public ReplyWriteForm(int bNumber, int mNumber, String reply) {
        this.bNumber = bNumber;
        this.mNumber = mNumber;
        this.reply = reply;
    }

    public int getbNumber() {
        return bNumber;
    }

    public void setbNumber(int bNumber) {
        this.bNumber = bNumber;
    }

    public int getmNumber() {
        return mNumber;
    }

    public void setmNumber(int mNumber) {
        this.mNumber = mNumber;
    }
}