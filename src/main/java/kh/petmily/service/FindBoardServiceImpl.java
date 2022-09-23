package kh.petmily.service;

import kh.petmily.dao.FindBoardDao;
import kh.petmily.domain.admin.form.AdminBoardListForm;
import kh.petmily.domain.find_board.FindBoard;
import kh.petmily.domain.find_board.form.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class FindBoardServiceImpl implements FindBoardService {

    private final FindBoardDao findBoardDao;
    private int size = 6;

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
    public void write(FindBoardWriteForm fwForm) {
        FindBoard findBoard = toFindFromFW(fwForm);
        findBoardDao.insert(findBoard);
    }

    @Override
    public void modify(FindBoardModifyForm fmForm) {
        FindBoard findBoard = toFindFromFM(fmForm);
        findBoard.setFaNumber(fmForm.getFaNumber());
        findBoardDao.update(findBoard);
    }

    @Override
    public void delete(int faNumber) {
        findBoardDao.delete(faNumber);
    }

    @Override
    public FindBoardDetailForm getDetailForm(int faNumber) {
        FindBoard findBoard = findBoardDao.findByPk(faNumber);
        FindBoardDetailForm detailForm = toDetailForm(findBoard);

        return detailForm;
    }

    @Override
    public FindBoardPageForm getFindPage(int pageNo, String species, String animalState, String keyword) {
        int total = findBoardDao.selectCount(species, animalState, keyword);
        List<FindBoardListForm> content = findBoardDao.selectIndex((pageNo - 1) * size + 1, (pageNo - 1) * size + size, species, animalState, keyword);

        return new FindBoardPageForm(total, pageNo, size, content);
    }

    @Override
    public FindBoardModifyForm getModifyForm(int faNumber) {
        FindBoard findBoard = findBoardDao.findByPk(faNumber);
        FindBoardModifyForm modifyForm = toModifyForm(findBoard);

        return modifyForm;
    }

    @Override
    public String findName(int faNumber) {
        return findBoardDao.selectName(faNumber);
    }

    @Override
    public int updateViewCount(int faNumber) {
        return findBoardDao.updateViewCount(faNumber);
    }

    @Override
    public FindBoardPageForm getMembersFindPage(int pageNo, int mNumber, String matched) {
        int total = findBoardDao.selectMemberCount(mNumber, matched);

        List<FindBoardListForm> content = findBoardDao.selectMemberIndex((pageNo - 1) * size + 1, (pageNo - 1) * size + size, mNumber, matched);

        return new FindBoardPageForm(total, pageNo, size, content);
    }

    @Override
    public FindBoard getFindBoard(int faNumber) {
        return findBoardDao.findByPk(faNumber);
    }

    @Override
    public List<AdminBoardListForm> selectAll() {
        List<AdminBoardListForm> list = new ArrayList<>();

        List<FindBoard> findList = findBoardDao.selectAll();

        for (FindBoard f : findList) {
            AdminBoardListForm ad = new AdminBoardListForm(f.getFaNumber(), findName(f.getMNumber()), f.getWrTime(), f.getTitle());
            list.add(ad);
        }

        return list;
    }

    private FindBoardDetailForm toDetailForm(FindBoard findBoard) {
        return new FindBoardDetailForm(findBoard.getFaNumber(), findBoard.getMNumber(), findName(findBoard.getFaNumber()), findBoard.getSpecies(), findBoard.getKind(), findBoard.getLocation(), findBoard.getAnimalState(), findBoard.getImgPath(), findBoard.getWrTime(), findBoard.getTitle(), findBoard.getContent(), findBoard.getViewCount());
    }

    private FindBoardModifyForm toModifyForm(FindBoard findBoard) {
        return new FindBoardModifyForm(findBoard.getSpecies(), findBoard.getKind(), findBoard.getLocation(), findBoard.getTitle(), findBoard.getContent());
    }

    private FindBoard toFindFromFW(FindBoardWriteForm req) {
        return new FindBoard(req.getMNumber(), req.getSpecies(), req.getKind(), req.getLocation(), req.getFullPath(), req.getTitle(), req.getContent());
    }

    private FindBoard toFindFromFM(FindBoardModifyForm req) {
        return new FindBoard(req.getMNumber(), req.getSpecies(), req.getKind(), req.getLocation(), req.getFullPath(), req.getTitle(), req.getContent());
    }

    private String getFullPath(String filename, String filePath) {
        return filePath + filename;
    }

    private String extractExt(String originalFilename) {
        int position = originalFilename.lastIndexOf(".");

        return originalFilename.substring(position + 1);
    }
}