package com.example.doanbe.payload.request;

import jakarta.validation.constraints.NotBlank;

public class OtpRequest {
    @NotBlank
    private String email;

    @NotBlank
    private String Otp;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOtp() {
        return Otp;
    }

    public void setOtp(String Otp) {
        this.Otp = Otp;
    }
}
