package kh.petmily.mapper;

import kh.petmily.domain.abandoned_animal.AbandonedAnimal;
import kh.petmily.domain.pet.Pet;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AbandonedAnimalMapper {

    // =======BasicMapper 메소드=======
    AbandonedAnimal selectByPk(int pk);

    void insert(AbandonedAnimal abandonedAnimal);

    void update(AbandonedAnimal abandonedAnimal);

    void delete(int pk);

    // =======BasicMapper 메소드=======
    int selectCountWithCondition(@Param("species") String species, @Param("gender") String gender, @Param("animalState") String animalState, @Param("keyword") String keyword);

    List<AbandonedAnimal> selectIndex(@Param("start") int start, @Param("end") int end);

    List<AbandonedAnimal> selectIndexWithCondition(@Param("start") int start, @Param("end") int end, @Param("species") String species, @Param("gender") String gender, @Param("animalState") String animalState, @Param("keyword") String keyword);

    String selectName(int pk);

    List<AbandonedAnimal> selectAll();

    int selectsNumber(int pk);

    List<Pet> selectPetIndex(@Param("start") int start, @Param("end") int end);

    int selectPetCount();

    @Select("select count(*) from ABANDONEDANIMAL ")
    int selectCount();

    void insertPet(Pet pet);

    void updatePet(Pet pet);

    void deletePet(int cpNumber);
}
