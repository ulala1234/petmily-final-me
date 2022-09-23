package kh.petmily.domain.look_board.form;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class LookBoardModifyForm {
    private int laNumber;
    private int mNumber;
    private String species;
    private String kind;
    private String location;
    private String fullPath;
    private MultipartFile imgPath;
    private String title;
    private String content;

    public LookBoardModifyForm(String species, String kind, String location, String title, String content) {
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.title = title;
        this.content = content;
    }
}