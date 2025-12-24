package com.javademoproject.services;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.beans.JavaBean;

@Service
public class MailSenderServiceImpl implements MailSenderService {

    @Autowired
    JavaMailSender mailSender;
    @Value("${spring.mail.username}")
    private String fromEmail;
    private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(MailSenderServiceImpl.class);
    @Override
    public void sendMail(String toEmail, String subject, String body) {

        logger.info("Sending email to {}, subject {}", toEmail, subject);
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
            mimeMessageHelper.setFrom(fromEmail);
            mimeMessageHelper.setTo(toEmail);
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(body,true);
            logger.info("Sending email to {}, subject {}", toEmail, subject);
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            logger.error("Error sending email to {}, subject {}", toEmail, subject);
            throw new RuntimeException(e);
        }
    }
}
