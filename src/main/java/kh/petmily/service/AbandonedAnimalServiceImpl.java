package kh.petmily.service;

import kh.petmily.dao.AbandonedAnimalDao;
import kh.petmily.domain.abandoned_animal.AbandonedAnimal;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalDetailForm;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalModifyForm;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalPageForm;
import kh.petmily.domain.abandoned_animal.form.AbandonedAnimalWriteForm;
import kh.petmily.domain.pet.Pet;
import kh.petmily.domain.pet.form.PetPageForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class AbandonedAnimalServiceImpl implements AbandonedAnimalService {

    private final AbandonedAnimalDao abandonedAnimalDao;
    private int size = 12;

    private String getFullPath(String filename, String filePath) {
        return filePath + filename;
    }

    private String extractExt(String originalFilename) {
        int position = originalFilename.lastIndexOf(".");

        return originalFilename.substring(position + 1);
    }

    @Override
    public String storeFile(MultipartFile file, String filePath) throws IOException {
        log.info("storeFile = {} ", file.getOriginalFilename());

        if (file.isEmpty()) {
            return null;
        }

        File storeFolder = new File(filePath);
        if (!storeFolder.exists()) {
            storeFolder.mkdir();
        }
        String originalFilename = file.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String storeFileName = uuid + "." + extractExt(originalFilename);
        String fullPath = getFullPath(storeFileName, filePath);
        file.transferTo(new File(fullPath));

        return storeFileName;
    }

    @Override
    public AbandonedAnimalPageForm getAbandonedAnimalPage(int pageNo) {
        int total = abandonedAnimalDao.selectCount();
        List<AbandonedAnimalDetailForm> content = abandonedAnimalDao.selectIndex((pageNo - 1) * size, size);

        return new AbandonedAnimalPageForm(total, pageNo, size, content);
    }

    @Override
    public AbandonedAnimalPageForm getAbandonedAnimalPage(int pageNo, String species, String gender, String animalState, String keyword) {
        int total = abandonedAnimalDao.selectCount(species, gender, animalState, keyword);
        log.info("total = {}", total);

        List<AbandonedAnimalDetailForm> content = abandonedAnimalDao.selectIndex((pageNo - 1) * size + 1, (pageNo - 1) * size + size, species, gender, animalState, keyword);

        AbandonedAnimalPageForm result = new AbandonedAnimalPageForm(total, pageNo, size, content);
        log.info("start = {}, end = {}", result.getStartPage(), result.getEndPage());

        return new AbandonedAnimalPageForm(total, pageNo, size, content);
    }

    @Override
    public PetPageForm getPetPage(int pageNum) {
        int total = abandonedAnimalDao.selectPetCount();
        List<Pet> content = abandonedAnimalDao.selectPetIndex((pageNum - 1) * size + 1, (pageNum - 1) * size + size);
        System.out.println("content = " + content);
        return new PetPageForm(total, pageNum, size, content);
    }

    @Override
    public String findName(int abNumber) {
        return abandonedAnimalDao.selectName(abNumber);
    }

    @Override
    public List<AbandonedAnimal> selectAll() {
        return abandonedAnimalDao.selectAll();
    }

    @Override
    public void savePet(Pet pet) {
        abandonedAnimalDao.insertPet(pet);
    }

    @Override
    public void modifyPet(Pet pet) {
        abandonedAnimalDao.updatePet(pet);
    }

    @Override
    public void deletePet(int cpNumber) {
        abandonedAnimalDao.deletePet(cpNumber);
    }

    @Override
    public AbandonedAnimalDetailForm getDetailForm(int abNumber) {
        AbandonedAnimal findABAnimal = abandonedAnimalDao.findByPk(abNumber);
        AbandonedAnimalDetailForm detailForm = toDetailForm(findABAnimal);

        return detailForm;
    }

    private AbandonedAnimalDetailForm toDetailForm(AbandonedAnimal domain) {
        return new AbandonedAnimalDetailForm(
                domain.getAbNumber(),
                domain.getSNumber(),
                domain.getAge(),
                domain.getWeight(),
                domain.getGender(),
                domain.getName(),
                domain.getSpecies(),
                domain.getKind(),
                domain.getLocation(),
                domain.getUniqueness(),
                domain.getDescription(),
                domain.getAnimalState(),
                domain.getImgPath(),
                domain.getAdmissionDate());
    }

    @Override
    public void write(AbandonedAnimalWriteForm abandonedAnimalWriteForm) {
        AbandonedAnimal abandonedAnimal = toAbandonedAnimalWriteForm(abandonedAnimalWriteForm);
        abandonedAnimalDao.insert(abandonedAnimal);
    }

    @Override
    public AbandonedAnimalModifyForm getAbandonedModify(int abNumber) {
        AbandonedAnimal abandonedAnimal = abandonedAnimalDao.findByPk(abNumber);
        AbandonedAnimalModifyForm modReq = toAbandonedAnimalModify(abandonedAnimal);

        return modReq;
    }

    @Override
    public void modify(AbandonedAnimalModifyForm modReq) {
        AbandonedAnimal abandonedAnimal = toAbandonedAnimalModifyForm(modReq);
        log.info("Service - abandonedAnimal : {}", abandonedAnimal);
        abandonedAnimalDao.update(abandonedAnimal);
    }

    @Override
    public void delete(int abNumber) {
        abandonedAnimalDao.delete(abNumber);
    }

    private AbandonedAnimal toAbandonedAnimalWriteForm(AbandonedAnimalWriteForm req) {
        return new AbandonedAnimal(
                req.getSNumber(),
                req.getName(),
                req.getSpecies(),
                req.getKind(),
                req.getGender(),
                req.getAge(),
                req.getWeight(),
                req.getFullPath(),
                req.getLocation(),
                req.getAdmissionDate(),
                req.getUniqueness(),
                req.getDescription(),
                req.getAnimalState());
    }

    private AbandonedAnimalModifyForm toAbandonedAnimalModify(AbandonedAnimal abandonedAnimal) {
        return new AbandonedAnimalModifyForm(
                abandonedAnimal.getAbNumber(),
                abandonedAnimal.getSNumber(),
                abandonedAnimal.getName(),
                abandonedAnimal.getSpecies(),
                abandonedAnimal.getKind(),
                abandonedAnimal.getGender(),
                abandonedAnimal.getAge(),
                abandonedAnimal.getWeight(),
                abandonedAnimal.getLocation(),
                abandonedAnimal.getAdmissionDate(),
                abandonedAnimal.getUniqueness(),
                abandonedAnimal.getDescription(),
                abandonedAnimal.getAnimalState()
        );
    }

    private AbandonedAnimal toAbandonedAnimalModifyForm(AbandonedAnimalModifyForm modReq) {
        return new AbandonedAnimal(
                modReq.getAbNumber(),
                modReq.getSNumber(),
                modReq.getName(),
                modReq.getSpecies(),
                modReq.getKind(),
                modReq.getGender(),
                modReq.getAge(),
                modReq.getWeight(),
                modReq.getFullPath(),
                modReq.getLocation(),
                modReq.getAdmissionDate(),
                modReq.getUniqueness(),
                modReq.getDescription(),
                modReq.getAnimalState()
        );
    }
}