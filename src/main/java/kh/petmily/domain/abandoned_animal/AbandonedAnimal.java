package kh.petmily.domain.abandoned_animal;

import kh.petmily.domain.DomainObj;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Blob;
import java.sql.Date;

@Getter
@NoArgsConstructor
@ToString
public class AbandonedAnimal implements DomainObj {

    private int abNumber;
    private int sNumber;    // 보호소 번호
    private String name;
    private String species;
    private String kind;
    private char gender;
    private int age;
    private float weight;
    private String imgPath;
    private String location;
    private Date admissionDate;
    private String uniqueness;
    private String description;
    private String animalState;
    private Blob video;

    public AbandonedAnimal(int abNumber, String name, String imgPath, String location, Date admissionDate) {
        this.abNumber = abNumber;
        this.name = name;
        this.imgPath = imgPath;
        this.location = location;
        this.admissionDate = admissionDate;
    }

    public AbandonedAnimal(int abNumber, int sNumber, String name, String imgPath, String animalState, String location, Date admissionDate) {
        this.abNumber = abNumber;
        this.sNumber = sNumber;
        this.name = name;
        this.imgPath = imgPath;
        this.animalState = animalState;
        this.location = location;
        this.admissionDate = admissionDate;
    }

    public AbandonedAnimal(int abNumber, int sNumber, String name, String species, String kind, char gender, int age, float weight, String imgPath, String location, Date admissionDate, String uniqueness, String description, String animalState, Blob video) {
        this.abNumber = abNumber;
        this.sNumber = sNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.gender = gender;
        this.age = age;
        this.weight = weight;
        this.imgPath = imgPath;
        this.location = location;
        this.admissionDate = admissionDate;
        this.uniqueness = uniqueness;
        this.description = description;
        this.animalState = animalState;
        this.video = video;
    }

    public AbandonedAnimal(int sNumber, String name, String species, String kind, char gender, int age, float weight, String imgPath, String location, Date admissionDate, String uniqueness, String description, String animalState) {
        this.sNumber = sNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.gender = gender;
        this.age = age;
        this.weight = weight;
        this.imgPath = imgPath;
        this.location = location;
        this.admissionDate = admissionDate;
        this.uniqueness = uniqueness;
        this.description = description;
        this.animalState = animalState;
    }

    public AbandonedAnimal(int abNumber, int sNumber, String name, String species, String kind, char gender, int age, float weight, String location, Date admissionDate, String uniqueness, String description, String animalState) {
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

    public AbandonedAnimal(int abNumber, int sNumber, String name, String species, String kind, char gender, int age, float weight, String imgPath, String location, Date admissionDate, String uniqueness, String description, String animalState) {
        this.abNumber = abNumber;
        this.sNumber = sNumber;
        this.name = name;
        this.species = species;
        this.kind = kind;
        this.gender = gender;
        this.age = age;
        this.weight = weight;
        this.imgPath = imgPath;
        this.location = location;
        this.admissionDate = admissionDate;
        this.uniqueness = uniqueness;
        this.description = description;
        this.animalState = animalState;
    }

    public AbandonedAnimal(String name, String species, int age, String imgPath, String description) {
        this.name = name;
        this.species = species;
        this.age = age;
        this.imgPath = imgPath;
        this.description = description;
    }

    public void setAbNumber(int abNumber) {
        this.abNumber = abNumber;
    }
}