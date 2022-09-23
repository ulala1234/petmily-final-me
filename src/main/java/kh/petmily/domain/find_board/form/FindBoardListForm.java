package kh.petmily.domain.find_board.form;

import lombok.Data;

import java.sql.Date;

@Data
public class FindBoardListForm {
    private int faNumber;
    private String name;
    private String species;
    private String kind;
    private String location;
    private String animalState;
    private String imgPath;
    private Date wrTime;
    private String title;
    private int viewCount;

    public FindBoardListForm(int faNumber, String name, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title) {
        this.faNumber = faNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.animalState = animalState;
        this.imgPath = imgPath;
        this.wrTime = wrTime;
        this.title = title;
    }

    public FindBoardListForm(int faNumber, String name, String species, String kind, String location, String animalState, String imgPath, Date wrTime, String title, int viewCount) {
        this.faNumber = faNumber;
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