package kh.petmily.service;

import kh.petmily.dao.MemberDao;
import kh.petmily.domain.member.Member;
import kh.petmily.domain.member.form.*;
import kh.petmily.mail.MailUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class MemberServiceImpl implements MemberService {

    private final MemberDao memberDao;
    private int size = 5;
    private final JavaMailSender mailSender;

    @Override
    public void join(JoinRequest joinReq) {
        Member member = toMember(joinReq);
        memberDao.insert(member);
    }

    @Override
    public Member login(String id, String pw) {
        Member member = memberDao.selectMemberById(id);

        if (!pw.equals(member.getPw())) {
            return null;
        }

        return member;
    }

    @Override
    public void withdraw(int mNumber) {
        memberDao.delete(mNumber);
    }

    @Override
    public boolean checkPwCorrect(int mNumber, String pw) {
        Member member = memberDao.findByPk(mNumber);

        return member.getPw().equals(pw);
    }

    @Override
    public boolean isPwEqualToConfirm(String pw, String confirmPw) {
        return pw != null && pw.equals(confirmPw);
    }

    @Override
    public Member modify(Member member, MemberChangeForm memberChangeForm) {
        Member mem = toMemberFromChange(member, memberChangeForm);

        memberDao.update(mem);

        log.info("Service - modify - member : {}", mem);

        return mem;
    }

    @Override
    public String findName(int mNumber) {
        return memberDao.selectName(mNumber);
    }

    @Override
    public List<Member> selectAll() {
        return memberDao.selectAll();
    }

    // by 은지, 221027, 봉사활동 신청서에서 회원 정보 받는 메소드
    @Override
    public MemberDetailForm getDetailForm(int mNumber) {
        Member findMember = memberDao.findByPk(mNumber);
        MemberDetailForm memberDetailForm = new MemberDetailForm(
                findMember.getName(), findMember.getBirth(),
                findMember.getEmail(), findMember.getPhone());

        return memberDetailForm;
    }

    // 관리자 페이지
    @Override
    public MemberPageForm getMemberPage(int pageNo) {
        int total = memberDao.selectCount();
        List<MemberDetailForm> content = memberDao.selectIndex((pageNo - 1) * size + 1, (pageNo - 1) * size + size);

        return new MemberPageForm(total, pageNo, size, content);
    }

    @Override
    public void delete(int mNumber) {
        memberDao.delete(mNumber);
    }

    @Override
    public MemberModifyForm getMemberModify(int mNumber) {
        Member member = memberDao.findByPk(mNumber);
        MemberModifyForm memberModifyForm = toMemberModify(member);

        return memberModifyForm;
    }

    @Override
    public void create(MemberCreateForm memberCreateForm) {
        Member member = toMember(memberCreateForm);

        memberDao.insert(member);
    }

    @Override
    public void modify(MemberModifyForm memberModifyForm) {
        Member member = toMember(memberModifyForm);

        memberDao.update(member);
    }

    // by 은지, email 과 id 가 DB에 있고 입력한 값과 일치하면 1, 그외는 0
    @Override
    public int memberCheck(String email, String id) {
        return memberDao.memberCheck(email, id);
    }

    // by 은지, 비밀번호 찾기 인증 메일 전송 - 링크 방식
    @Override
    public void sendEmail(String email, String id) throws Exception {
        MailUtils sendMail = new MailUtils(mailSender);

        sendMail.setSubject("[Petmily 비밀번호 찾기 인증 메일입니다.]");
        sendMail.setText(
                "<h1>Petmily 메일인증</h1>" +
                        "<br/>" + id + "님 " +
                        "<br/>비밀번호 찾기를 통해 새 비밀번호로 변경하시려면" +
                        "<br/>아래 [이메일 인증 확인]을 눌러주세요." +
                        "<br/><a href='http://localhost:8080/member/pwChange?email=" + email +
                        "&id=" + id +
                        "' target='_blank'>이메일 인증 확인</a>");
        sendMail.setFrom("petmilykh@gmail.com", "Petmily");
        sendMail.setTo(email);
        sendMail.send();
    }

    // by 은지, view 에서 비밀번호와 비밀번호 확인이 일치한다면 비밀번호 변경
    @Override
    public Member pwChange(PwChangeRequest pwChangeRequest) {
        Member member = toMember(pwChangeRequest);

        memberDao.pwChange(member);
        log.info("Service - pwChange - member ={}", member);

        return member;
    }

    private Member toMember(MemberCreateForm memberCreateForm) {
        Member member = new Member(memberCreateForm.getMNumber(), memberCreateForm.getId(), memberCreateForm.getPw(), memberCreateForm.getName(), (Date) memberCreateForm.getBirth(), memberCreateForm.getGender(), memberCreateForm.getEmail(), memberCreateForm.getPhone(), memberCreateForm.getGrade());

        return member;
    }

    private Member toMember(MemberModifyForm memberModifyForm) {
        Member member = new Member(memberModifyForm.getMNumber(), memberModifyForm.getId(), memberModifyForm.getPw(), memberModifyForm.getName(), (Date) memberModifyForm.getBirth(), memberModifyForm.getGender(), memberModifyForm.getEmail(), memberModifyForm.getPhone(), memberModifyForm.getGrade());

        return member;
    }

    private MemberModifyForm toMemberModify(Member member) {
        return new MemberModifyForm(member.getMNumber(), member.getId(), member.getPw(), member.getName(), member.getBirth(), member.getGender(), member.getEmail(), member.getPhone(), member.getGrade());
    }

    private Member toMemberFromChange(Member member, MemberChangeForm memberChangeForm) {
        return new Member(member.getMNumber(), member.getId(), memberChangeForm.getPw(), memberChangeForm.getName(), member.getBirth(), member.getGender(), memberChangeForm.getEmail(), memberChangeForm.getPhone(), member.getGrade());
    }

    private Member toMember(JoinRequest joinReq) {
        String id = joinReq.getId();
        String pw = joinReq.getPw();
        String name = joinReq.getName();
        Date birth = joinReq.getBirth();
        String gender = joinReq.getGender();
        String email = joinReq.getEmail();
        String phone = joinReq.getPhone();

        return new Member(id, pw, name, birth, gender, email, phone);
    }

    private Member toMember(PwChangeRequest pwChangeRequest) {
        String id = pwChangeRequest.getId();
        String pw = pwChangeRequest.getPw();
        String email = pwChangeRequest.getEmail();

        return new Member(id, pw, email);
    }
}