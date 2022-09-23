package kh.petmily.domain.board;

import kh.petmily.domain.DomainObj;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Blob;
import java.sql.Date;

@Getter
@NoArgsConstructor
public class Board implements DomainObj {
    private int bNumber;
    private int mNumber;
    private String name;
    private String kindOfBoard;
    private String title;
    private String content;
    private String imgPath;
    private Blob video;
    private Date wrTime;
    private String checkPublic;
    private int viewCount;
    private String sort;

    public Board(int mNumber, int bNumber, String kindOfBoard, String title, String content, String imgPath, Blob video, Date wrTime, String checkPublic, int viewCount) {
        this.bNumber = bNumber;
        this.mNumber = mNumber;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.imgPath = imgPath;
        this.video = video;
        this.wrTime = wrTime;
        this.checkPublic = checkPublic;
        this.viewCount = viewCount;
    }

    public Board(int mNumber, int bNumber, String name, String kindOfBoard, String title, String content, Date wrTime, String checkPublic) {
        this.mNumber = mNumber;
        this.bNumber = bNumber;
        this.name = name;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.wrTime = wrTime;
        this.checkPublic = checkPublic;
    }

    public Board(int mNumber, int bNumber, String name, String kindOfBoard, String title, String content, Date wrTime, String checkPublic, int viewCount, String sort) {
        this.mNumber = mNumber;
        this.bNumber = bNumber;
        this.name = name;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.wrTime = wrTime;
        this.checkPublic = checkPublic;
        this.viewCount = viewCount;
        this.sort = sort;
    }

    public Board(int mNumber, String kindOfBoard, String title, String content, String checkPublic) {
        this.mNumber = mNumber;
        this.kindOfBoard = kindOfBoard;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
    }

    public Board(int bNumber, String title, String content, String checkPublic) {
        this.bNumber = bNumber;
        this.title = title;
        this.content = content;
        this.checkPublic = checkPublic;
    }

    public void setName(String name) {
        this.name = name;
    }
}
