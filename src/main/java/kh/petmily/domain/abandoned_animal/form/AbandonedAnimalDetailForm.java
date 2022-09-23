package kh.petmily.domain.abandoned_animal.form;

import lombok.Data;

import java.sql.Date;

@Data
public class AbandonedAnimalDetailForm {

    private int abNumber;
    private int sNumber;    // 보호소 번호
    private int age;
    private float weight;
    private char gender;
    private String name;
    private String species;
    private String kind;
    private String location;
    private String uniqueness;
    private String description;
    private String animalState;
    private String imgPath;
    private Date admissionDate;
    //    private Blob video;


    public AbandonedAnimalDetailForm() {
    }

    public AbandonedAnimalDetailForm(int abNumber, int sNumber, int age, float weight, char gender, String name, String species, String kind, String location, String uniqueness, String description, String animalState, String imgPath, Date admissionDate) {
        this.abNumber = abNumber;
        this.sNumber = sNumber;
        this.age = age;
        this.weight = weight;
        this.gender = gender;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.location = location;
        this.uniqueness = uniqueness;
        this.description = description;
        this.animalState = animalState;
        this.imgPath = imgPath;
        this.admissionDate = admissionDate;
    }
}
