const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
require("dotenv").config();

const app = express();

const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);


app.use(express.json());
db_pass = process.env.MONGODB;

const db = "mongodb+srv://muthavarun07_db_user:"+db_pass+"@cluster0.rspqo7u.mongodb.net/?appName=Cluster0";

io.on("connection", (socket)=>{
    console.log("Connected");
    socket.on("createRoom", ({nickname})=>{
         
    });
});

mongoose.connect(db).then(()=>{
    console.log("connnection sucessful");
    })
    .catch((e)=>{
        console.log(e);
    });

server.listen(port, "0.0.0.0", ()=>{ 
    console.log("server stated on "+port);
});


