package org.example.model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UserPost {
    private String name;
    private String job;

    public UserPost() {
        // Вот где собака порылась
        // Для десериализации объекта jackson'у нужен был пустой конструктор
        // Я вам об этом напоминал несколько раз, а сейчас сам забыл
    }

    public UserPost(String name, String job) {
        this.name = name;
        this.job = job;
    }

    public String getName() {
        return name;
    }
    public String getJob() {
        return job;
    }
    public String toJson() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(this);
    }

    public UserPost(String json) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        UserPost userPost = objectMapper.readValue(json, UserPost.class);
        this.name = userPost.getName();
        this.job = userPost.getJob();
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("name", this.name);
        map.put("job", this.job);
        return map;
    }
}
