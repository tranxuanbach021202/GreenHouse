package com.example.doanbe.dto;

import lombok.Data;

@Data
public class RegisterRequestDTO {
    private String username;
    private String email;
    private String password;
}