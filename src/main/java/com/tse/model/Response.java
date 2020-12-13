package com.tse.model;

public class Response {
    private String name;
    private String ageNow;

    public Response(String name, String ageNow) {
        this.name = name;
        this.ageNow = ageNow;
    }

    public String getName() {
        return name;
    }

    public String getAgeNow() {
        return ageNow;
    }
}
