package org.example;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.javafaker.Faker;
import org.example.model.UserCreated;
import org.example.model.UserPost;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

public class DataHelper {
    private static final Faker faker = new Faker(new Locale("en"));
    public static String getUserPostJson(String name, String job) throws IOException {
        return new UserPost(name, job).toJson();
    }

    public static Map<String, Object> getUserPostMap(String json) throws JsonProcessingException {
        return new UserPost(json).toMap();
    }

    public static String getAnyUserPostJson() throws IOException {
        return getUserPostJson(faker.name().fullName(), faker.job().title());
    }

    public static Map<String, Object> getUserCreatedMap() {
        return new UserCreated().toMap();
    }

    public static void printMessage(Object message){
        System.out.println(message);
    }
}
