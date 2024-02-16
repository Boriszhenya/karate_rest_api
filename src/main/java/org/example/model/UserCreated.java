package org.example.model;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UserCreated {
    private final String id;
    private final String createdAt;

    public UserCreated(){
        this.id = "#string";
        this.createdAt = "#string";
    }

    public String toJson() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(this);
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", this.id);
        map.put("createdAt", this.createdAt);
        return map;
    }
}
