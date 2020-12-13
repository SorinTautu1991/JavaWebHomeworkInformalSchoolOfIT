package com.tse.servlets;

import com.google.gson.Gson;
import com.tse.entity.Person;
import com.tse.model.Response;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet(urlPatterns = {"/calculateAge"})
public class AgeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        BufferedReader bf = new BufferedReader(new InputStreamReader(req.getInputStream()));
        String json = null;
        if(bf != null){
            json = bf.readLine();
        }

        Person person = gson.fromJson(json, Person.class);
        String calculatedAge = person.calculateAge(person.getDateOfBirth());
        person.setCalculatedAge(calculatedAge);
        Response response = new Response(person.getName(), calculatedAge);
        resp.setContentType("application/json");
        resp.getWriter().write(gson.toJson(response));
    }
}
