package kh.petmily.domain.abandoned_animal.form;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Data
@NoArgsConstructor
public class AbandonedAnimalModifyForm {

    private int abNumber;
    private int sNumber;
    private String name;
    private String species;
    private String kind;
    private char gender;
    private int age;
    private float weight;
    private String fullPath;
    private MultipartFile imgPath;
    private String location;
    private Date admissionDate;
    private String uniqueness;
    private String description;
    private String animalState;

    public AbandonedAnimalModifyForm(int abNumber, int sNumber, String name, String species, String kind, char gender, int age, float weight, String location, Date admissionDate, String uniqueness, String description, String animalState) {
        this.abNumber = abNumber;
        this.sNumber = sNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.gender = gender;
        this.age = age;
        this.weight = weight;
        this.location = location;
        this.admissionDate = admissionDate;
        this.uniqueness = uniqueness;
        this.description = description;
        this.animalState = animalState;
    }

    public void setSNumber(int sNumber) {
        this.sNumber = sNumber;
    }
}