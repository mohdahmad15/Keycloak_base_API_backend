package com.javademoproject.services;

public interface MailSenderService {
    public void sendMail(String toEmail,String subject,String body);
}
