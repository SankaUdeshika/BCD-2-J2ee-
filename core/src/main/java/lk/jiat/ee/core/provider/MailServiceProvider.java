package lk.jiat.ee.core.provider;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import lk.jiat.ee.core.mail.Mailable;

import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class MailServiceProvider {
    private final Properties properties = new Properties();
    private Authenticator authenticator;
    private static volatile MailServiceProvider instance;
    private ThreadPoolExecutor executor;
    private final BlockingQueue<Runnable> blockingQueue = new LinkedBlockingQueue<>();

    private MailServiceProvider() {
        properties.put("mail.smtp.host", "sandbox.smtp.mailtrap.io");
        properties.put("mail.smtp.port", "2525");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "false");
    }

    public static MailServiceProvider getInstance() {
        if (instance == null) {
            synchronized (MailServiceProvider.class) {
                if (instance == null) {
                    instance = new MailServiceProvider();
                }
            }
        }
        return instance;
    }

    public void start() {
        authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("fa364dc14f654b", "b120c025c1eb53");
            }
        };

        executor = new ThreadPoolExecutor(
                5, 10, 5, TimeUnit.SECONDS,
                blockingQueue,
                new ThreadPoolExecutor.AbortPolicy()
        );
        System.out.println("Started mail service provider");
    }

    public void sendMail(Mailable mailable) {
        if (executor == null) {
            throw new IllegalStateException("MailServiceProvider not started. Call start() first.");
        }
        executor.execute(mailable);
    }

    public Properties getProperties() {
        return properties;
    }

    public Authenticator getAuthenticator() {
        return authenticator;
    }

    public void shutdown() {
        if (executor != null) {
            executor.shutdown();
            try {
                if (!executor.awaitTermination(60, TimeUnit.SECONDS)) {
                    executor.shutdownNow();
                }
            } catch (InterruptedException e) {
                executor.shutdownNow();
                Thread.currentThread().interrupt();
            }
        }
    }
}