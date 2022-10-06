package kh.petmily.service;

import kh.petmily.domain.email_check.EmailCheck;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface EmailService {
    public MimeMessage createEmailForm(String email) throws MessagingException;
    public String sendEmail(String email) throws MessagingException;
}
