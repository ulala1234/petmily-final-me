package kh.petmily.domain.pet.form;


import kh.petmily.domain.pet.Pet;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PetForm {

    int cpNumber;
    int mNumber;
    String userId;
    String name;
    String species;
    String kind;
    String gender;

    public PetForm(String userId, String name, String specices, String kind, String gender) {
        this.userId = userId;
        this.name = name;
        this.species = specices;
        this.kind = kind;
        this.gender = gender;
    }

    public PetForm(Pet pet) {
        this.cpNumber = pet.getCpNumber();
        this.mNumber = pet.getMNumber();
        this.userId = pet.getUserId();
        this.name = pet.getName();
        this.species = pet.getSpecies();
        this.kind = pet.getKind();
        this.gender = pet.getGender();
    }
}
