package kh.petmily.domain.pet
        ;

import kh.petmily.domain.pet.form.PetForm;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Pet {

    int cpNumber;
    int mNumber;
    String userId;
    String name;
    String species;
    String kind;
    String gender;

    public Pet(PetForm form) {
        this.cpNumber = form.getCpNumber();
        this.mNumber = form.getMNumber();
        this.userId = form.getUserId();
        this.name = form.getName();
        this.species = form.getSpecies();
        this.kind = form.getKind();
        this.gender = form.getGender();
    }
}
