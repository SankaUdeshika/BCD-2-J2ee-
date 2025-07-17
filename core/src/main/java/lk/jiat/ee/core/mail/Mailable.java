package lk.jiat.ee.core.mail;

import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lk.jiat.ee.core.provider.MailServiceProvider;

public abstract class Mailable implements Runnable {
    private final MailServiceProvider mailServiceProvider;

    public Mailable() {
        this.mailServiceProvider = MailServiceProvider.getInstance();
    }

    @Override
    public void run() {
        try {
            Session session = Session.getInstance(
                    mailServiceProvider.getProperties(),
                    mailServiceProvider.getAuthenticator()
            );

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("app@j2ee-example.com"));
            build(message);
            Transport.send(message);
        } catch (Exception e) {
            System.err.println("Failed to send email: " + e.getMessage());
            throw new RuntimeException("Email sending failed", e);
        }
    }

    public abstract void build(Message message) throws Exception;
}