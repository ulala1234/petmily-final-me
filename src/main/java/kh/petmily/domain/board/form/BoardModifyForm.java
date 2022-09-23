package kh.petmily.domain.board.form;

import lombok.Data;

@Data
public class BoardModifyForm {

    private int bNumber;
    private int mNumber;
    private String title;
    private String content;
    private String checkPublic;

    public BoardModifyForm(int bNumber, String title, String content, String checkPublic) {
        this.bNumber = bNumber;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
    }
}
