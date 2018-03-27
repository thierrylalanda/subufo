/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.SendMessage;

import java.util.Date;
import java.util.Properties;
import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author messi
 */
@Stateless
public class EnvoiEmail {

    public static void sendMail(String To, String subject, String messages) throws MessagingException {

        final String serveur = "smtp.gmail.com";
        final String username = "application.gic@gmail.com";
        final String password = "charly155";

        Properties prop = System.getProperties();
        prop.setProperty("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.host", serveur);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.port", "587");
        prop.put("mail-smtp-socketFactory-class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail-smtp-socketFactory-port", "587");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail-smtp-socketFactory-fallback ", "false");

        Session session = Session.getDefaultInstance(prop, null);
        session.setDebug(true);

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(To));
        message.setSubject(subject);
        message.setContent(messages, "text/html");
        message.setSentDate(new Date());
        message.saveChanges();

        try {
            Transport transport = session.getTransport("smtp");
            transport.connect(serveur, username, password);
            transport.sendMessage(message, message.getAllRecipients());
        } catch (Exception e) {
            e.getCause();
        }
    }

    public static boolean sendMailHTML(String To, String from, String password, String copy, String copy2, String subject, String messages) throws MessagingException {
        boolean error = false;
        final String serveur = "smtp.gmail.com";
        final String username = from;

        Properties prop = System.getProperties();
        prop.setProperty("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.host", serveur);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.port", "587");
        prop.put("mail-smtp-socketFactory-class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail-smtp-socketFactory-port", "587");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail-smtp-socketFactory-fallback ", "false");

        Session session = Session.getDefaultInstance(prop, null);
        session.setDebug(true);

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        if (!copy.isEmpty()) {

            message.addRecipient(Message.RecipientType.CC, new InternetAddress(copy));
        }
        if (!copy2.isEmpty()) {

            message.addRecipient(Message.RecipientType.CC, new InternetAddress(copy2));
        }
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(To));
        message.setSubject(subject);
        message.setContent(messages, "text/html");
        message.setSentDate(new Date());
        message.saveChanges();

        try {
            Transport transport = session.getTransport("smtp");
            transport.connect(serveur, username, password);
            transport.sendMessage(message, message.getAllRecipients());
        } catch (Exception e) {
            error = true;
        }
        return error;
    }

}
