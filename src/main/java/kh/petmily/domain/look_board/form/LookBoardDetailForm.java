package kh.petmily.domain.look_board.form;

import lombok.Data;

import java.sql.Date;

@Data
public class LookBoardDetailForm {
    private int laNumber;
    private int mNumber;
    private String name;
    private String species;
    private String kind;
    private String location;
    private String animalState;
    private String imgPath;
    private Date wrTime;
    private String title;
    private String content;
    // ====== 조회수 추가 ======
    private int viewCount;

    public LookBoardDetailForm(int laNumber, int mNumber, String name, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title, String content) {
        this.laNumber = laNumber;
        this.mNumber = mNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.animalState = animalState;
        this.imgPath = imgPath;
        this.wrTime = wrTime;
        this.title = title;
        this.content = content;
    }

    // ====== 조회수 추가 ======
    public LookBoardDetailForm(int laNumber, int mNumber, String name, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title, String content, int viewCount) {
        this.laNumber = laNumber;
        this.mNumber = mNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.animalState = animalState;
        this.imgPath = imgPath;
        this.wrTime = wrTime;
        this.title = title;
        this.content = content;
        this.viewCount = viewCount;
    }
}