package kh.petmily.service;

import kh.petmily.domain.abandoned_animal.AbandonedAnimal;
import kh.petmily.domain.abandoned_animal.form.*;
import kh.petmily.domain.pet.Pet;
import kh.petmily.domain.pet.form.PetPageForm;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface AbandonedAnimalService {

    public AbandonedAnimalDetailForm getDetailForm(int abNumber);

    public AbandonedAnimalPageForm getAbandonedAnimalPage(int pageNo);

    public AbandonedAnimalPageForm getAbandonedAnimalPage(int pageNo, String species, String gender, String animalState, String keyword);

    public PetPageForm getPetPage(int pageNo);

    public String findName(int abNumber);

    List<AbandonedAnimal> selectAll();

    public void write(AbandonedAnimalWriteForm abandonedAnimalWriteForm);

    public AbandonedAnimalModifyForm getAbandonedModify(int abNumber);

    public void modify(AbandonedAnimalModifyForm abandonedAnimalModifyForm);

    public String storeFile(MultipartFile file, String filePath) throws IOException;

    public void delete(int abNumber);

    public void savePet(Pet pet);

    public void modifyPet(Pet pet);

    public void deletePet(int cpNumber);

    List<OldAbandonedAnimalListForm> oldAbandonedList();
}