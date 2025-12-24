package com.javademoproject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailSendToUserServiceImpl implements MailSendToUserService{

    @Autowired
    MailSenderService mailSenderService;

    @Override
    public String sendMailToUser(String toEmail, String subject, String body) {
        try{
            if (toEmail==null||subject==null||body==null||body.isEmpty()) {
                return "Invalid email details: To, subject, and body cannot be empty.";
            }
            mailSenderService.sendMail(toEmail,subject,body);
            return "Mail sent successfully:"+toEmail;
        }
        catch (Exception e){
            return "Mail send failed: "+e.getMessage();
        }
    }
}
