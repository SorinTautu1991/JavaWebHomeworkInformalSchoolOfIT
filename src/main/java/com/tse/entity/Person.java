package com.tse.entity;

import org.joda.time.LocalDate;
import org.joda.time.Period;
import org.joda.time.PeriodType;

public class Person {
    private String name;
    private String dateOfBirth;
    private String calculatedAge;

    public Person(String name, String dateOfBirth) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
    }

    public String calculateAge(String date){
        String[] dates = date.split("-");
        int year = Integer.parseInt(dates[0]);
        int month = Integer.parseInt(dates[1]);
        int day = Integer.parseInt(dates[2]);
        LocalDate now = new LocalDate();
        LocalDate birthDay = new LocalDate(year, month, day);
        Period period = new Period(birthDay, now, PeriodType.days());
        return String.valueOf(period.getDays());
    }

    public void setCalculatedAge(String calculatedAge) {
        this.calculatedAge = calculatedAge;
    }

    public String getName() {
        return name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public String getCalculatedAge() {
        return calculatedAge;
    }
}
