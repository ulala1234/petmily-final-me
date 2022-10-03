package kh.petmily.domain.board.form;

import lombok.Data;

import java.util.Date;

@Data
public class ReadBoardForm {

    private int bNumber;
    private int mNumber;
    private String name;
    private String kindOfBoard;
    private String title;
    private String content;
    private Date wrTime;
    private String checkPublic;
    private int viewCount;
    private int replyCount;
    private String sort;

    public ReadBoardForm(int bNumber, int mNumber, String name, String kindOfBoard, String title, String content, Date wrTime, String checkPublic, int viewCount, int replyCount, String sort) {
        this.bNumber = bNumber;
        this.mNumber = mNumber;
        this.name = name;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.wrTime = wrTime;
        this.checkPublic = checkPublic;
        this.viewCount = viewCount;
        this.replyCount = replyCount;
        this.sort = sort;
    }
}