package kh.petmily.domain.look_board;

import kh.petmily.domain.DomainObj;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Date;

@Getter
@ToString
@NoArgsConstructor
public class LookBoard implements DomainObj {
    private int laNumber;
    private int mNumber;
    private String species;
    private String kind;
    private String location;
    private String animalState;
    private String imgPath;
    private Date wrTime;
    private String title;
    private String content;
    private int viewCount;

    public LookBoard(int mNumber, String species, String kind, String location, String imgPath, String title, String content) {
        this.mNumber = mNumber;
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.imgPath = imgPath;
        this.title = title;
        this.content = content;
    }

    public LookBoard(int laNumber, int mNumber, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title, String content) {
        this.laNumber = laNumber;
        this.mNumber = mNumber;
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
    public LookBoard(int laNumber, int mNumber, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title, String content, int viewCount) {
        this.laNumber = laNumber;
        this.mNumber = mNumber;
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

    public void setLaNumber(int laNumber) {
        this.laNumber = laNumber;
    }
}