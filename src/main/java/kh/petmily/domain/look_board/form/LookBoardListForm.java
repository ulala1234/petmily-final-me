package kh.petmily.domain.look_board.form;

import lombok.Data;

import java.sql.Date;

@Data
public class LookBoardListForm {
    private int laNumber;
    private String name;
    private String species;
    private String kind;
    private String location;
    private String animalState;
    private String imgPath;
    private Date wrTime;
    private String title;
    // ====== 조회수 추가 ======
    private int viewCount;

    public LookBoardListForm(int laNumber, String name, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title) {
        this.laNumber = laNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.animalState = animalState;
        this.imgPath = imgPath;
        this.wrTime = wrTime;
        this.title = title;
    }

    // ====== 조회수 추가 ======
    public LookBoardListForm(int laNumber, String name, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title, int viewCount) {
        this.laNumber = laNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.animalState = animalState;
        this.imgPath = imgPath;
        this.wrTime = wrTime;
        this.title = title;
        this.viewCount = viewCount;
    }
}