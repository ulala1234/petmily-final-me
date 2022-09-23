package kh.petmily.domain.board.form;

import kh.petmily.domain.DomainObj;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class WriteBoardForm implements DomainObj {
    private int mNumber;
    private String kindOfBoard;
    private String title;
    private String content;
    private String checkPublic;

    public WriteBoardForm(int mNumber, String kindOfBoard, String title, String content, String checkPublic) {
        this.mNumber = mNumber;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
    }
}