package com.example.webdemo;

import java.sql.Timestamp;

public class Msg {
    private String content;
    private String ID;
    private String G_ID;
    private Timestamp time;

    public String getID() {
        return ID;
    }

    public String getContent() {
        return content;
    }

    public Timestamp getTime() {
        return time;
    }

    public String getG_ID() {
        return G_ID;
    }

    public Msg(String content, String ID, String G_ID, Timestamp time) {
        this.content = content;
        this.G_ID = G_ID;
        this.time = time;
        this.ID = ID;
    }
}
