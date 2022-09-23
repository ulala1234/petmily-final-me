package kh.petmily.service;

import kh.petmily.domain.abandoned_animal.form.AdoptTempSubmitForm;
import kh.petmily.domain.adopt.Adopt;
import kh.petmily.domain.adopt.form.*;
import kh.petmily.domain.temp.form.TempApplyPageForm;

import java.util.List;

public interface AdoptTempService {

    public void adopt(AdoptTempSubmitForm adoptTempSubmitForm);

    public void tempProtect(AdoptTempSubmitForm adoptTempSubmitForm);

    AdoptApplyPageForm getAdoptApplyPage(int pageNo, int mNumber, String type);

    TempApplyPageForm getTempApplyPage(int pageNo, int mNumber, String type);

    public Adopt findByPk(int adNumber);

    // 관리자 페이지
    public AdoptPageForm getAdoptWaitPage(int pageNo, String status);

    public TempPageForm getTempWaitPage(int pageNo, String status);

    public List<AdoptDetailForm> adoptApprove(int adNumber);

    public List<AdoptDetailForm> adoptRefuse(int adNumber);

    public List<TempDetailForm> tempApprove(int tNumber);

    public List<TempDetailForm> tempRefuse(int tNumber);
}