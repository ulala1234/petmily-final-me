package kh.petmily.domain.look_board.form;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
public class LookBoardWriteForm {
    private int mNumber;
    private String species;
    private String kind;
    private String location;
    private String fullPath;
    private MultipartFile imgPath;
    private String title;
    private String content;

    public LookBoardWriteForm(String species, String kind, String location, String fullPath, MultipartFile imgPath, String title, String content) {
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.imgPath = imgPath;
        this.fullPath = fullPath;
        this.title = title;
        this.content = content;
    }
}