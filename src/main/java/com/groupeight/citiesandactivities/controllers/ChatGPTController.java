package com.groupeight.citiesandactivities.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.groupeight.citiesandactivities.services.ChatGPTService;


@Controller
public class ChatGPTController {

    @Autowired
    private ChatGPTService chatGPTService;
    
    @GetMapping("/chat")
    public String chatPage() {
    	return "chatgpt.jsp";
    }

    @PostMapping("/chat")
    public String chat(@RequestParam("prompt") String prompt, Model model) {
        try {
        	System.out.println(prompt);
            String response=  chatGPTService.chat(prompt);
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response);
            String content = jsonNode.path("choices").get(0).path("message").path("content").asText();
            model.addAttribute("response",content);
            return "chatgpt.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("response", "Error");
            return "chatgpt.jsp";
        }
    }
}