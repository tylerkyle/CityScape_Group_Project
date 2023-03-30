package com.groupeight.citiesandactivities.services;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Service
public class ChatGPTService {

    @Autowired
    private OkHttpClient okHttpClient;

    @Value("${openai.apikey}")
    private String apiKey;

    public String chat(String prompt) throws IOException {
        String url = "https://api.openai.com/v1/chat/completions";

        MediaType JSON = MediaType.get("application/json; charset=utf-8");
        String requestBodyJson = "{\"model\": \"gpt-3.5-turbo\",\"messages\":[{\"role\":\"system\",\"content\":\"You're city tour guide.\"},{\"role\":\"user\",\"content\":\"" + prompt + "\"}]}";
        @SuppressWarnings("deprecation")
		RequestBody requestBody = RequestBody.create(JSON, requestBodyJson);

        Request request = new Request.Builder()
                .url(url)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Bearer " + apiKey)
                .post(requestBody)
                .build();

        Response response = okHttpClient.newCall(request).execute();
        return response.body().string();
    }
}