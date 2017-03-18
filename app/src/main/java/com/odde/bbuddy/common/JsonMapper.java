package com.odde.bbuddy.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

public class JsonMapper<T> {

    private final Class<T> clazz;
    private final ObjectMapper mapper = new ObjectMapper();

    public JsonMapper(Class<T> clazz) {
        this.clazz = clazz;
    }

    public JSONObject jsonOf(T t) {
        try {
            return new JSONObject(mapper.writeValueAsString(t));
        } catch (JSONException | JsonProcessingException e) {
            throw new IllegalStateException();
        }
    }

    public List<T> fromJsonArray(JSONArray response) {
        try {
            return mapper.readValue(response.toString(), typeToBeMapped());
        } catch (IOException e) {
            throw new IllegalStateException();
        }
    }

    private CollectionType typeToBeMapped() {
        return mapper.getTypeFactory().constructCollectionType(List.class, clazz);
    }

}
