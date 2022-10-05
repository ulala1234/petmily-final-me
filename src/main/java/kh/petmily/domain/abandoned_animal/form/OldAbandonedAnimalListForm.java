package kh.petmily.domain.abandoned_animal.form;

import lombok.Data;

@Data
public class OldAbandonedAnimalListForm {
    private String description;
    private String imgPath;
    private String name;
    private int age;
    private String species;

    public OldAbandonedAnimalListForm(String description, String imgPath, String name, int age, String species) {
        this.description = description;
        this.imgPath = imgPath;
        this.name = name;
        this.age = age;
        this.species = species;
    }
}