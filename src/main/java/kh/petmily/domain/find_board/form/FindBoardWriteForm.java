package kh.petmily.domain.find_board.form;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
public class FindBoardWriteForm {
    private int mNumber;
    private String species;
    private String kind;
    private String location;
    private String fullPath;
    private MultipartFile imgPath;
    private String title;
    private String content;

    public FindBoardWriteForm(String species, String kind, String location, String fullPath, MultipartFile imgPath, String title, String content) {
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.fullPath = fullPath;
        this.imgPath = imgPath;
        this.title = title;
        this.content = content;
    }
}