package kh.petmily.service;

import kh.petmily.domain.mail.EmailCheck;
import kh.petmily.domain.mail.form.EmailCodeRequest;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface EmailService {
    public MimeMessage createEmailForm(String email) throws MessagingException;

    public String sendEmail(String email) throws MessagingException;

    void registEmailCheck(String address, String code);

    public EmailCheck makeEmailCheck(EmailCodeRequest mailAuth);

}
