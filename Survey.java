package com.example;

public class Survey {
    private String fruit;
    private int votes;

    public Survey(String fruit) {
        this.fruit = fruit;
        this.votes = 0;
    }

    public String getFruit() {
        return fruit;
    }

    public void setFruit(String fruit) {
        this.fruit = fruit;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }
}
