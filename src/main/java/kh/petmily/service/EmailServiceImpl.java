package kh.petmily.service;

import kh.petmily.domain.email_check.EmailCheck;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {
    private final JavaMailSender emailSender;
    private final SpringTemplateEngine templateEngine;
    private String randVerificationCode;

    public void createVerificationCode() {
        Random rand = new Random();
        StringBuffer key = new StringBuffer();

        for(int i = 0 ; i < 8 ; i++) {
            int index = rand.nextInt(3);

            switch(index) {
                case 0:
                    key.append((char) ((int)rand.nextInt(26) + 97)); //a-z
                    break;
                case 1:
                    key.append((char) ((int)rand.nextInt(26) + 65)); //A-Z
                    break;
                case 2:
                    key.append(rand.nextInt(10)); //0-9
                    break;
            }
        }

        randVerificationCode = key.toString();
    }

    @Override
    public MimeMessage createEmailForm(String email) throws MessagingException {
        createVerificationCode();

        String setFrom = "modumoasazin@gmail.com";
        String title = "Petmily 회원가입 이메일 인증 번호입니다.";

        MimeMessage message = emailSender.createMimeMessage();

        message.addRecipients(MimeMessage.RecipientType.TO, email);
        message.setSubject(title);
        message.setFrom(setFrom);
        message.setText(setContext(randVerificationCode), "utf-8", "html");

        return message;
    }

    @Override
    public String sendEmail(String email) throws MessagingException {
        MimeMessage emailForm = createEmailForm(email);
        emailSender.send(emailForm);

        return randVerificationCode;
    }

    public String setContext(String code) {
        Context context = new Context();
        context.setVariable("code", code);
        return templateEngine.process("checkEmail", context);
    }
}