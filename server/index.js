const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
require("dotenv").config();
const Room = require("./models/room");
const e = require("express");

const app = express();

const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"]
  }
});


app.use(express.json());
db_pass = process.env.MONGODB;

const db = "mongodb+srv://muthavarun07_db_user:"+db_pass+"@cluster0.rspqo7u.mongodb.net/?appName=Cluster0";

mongoose.connect(db).then(()=>{
    console.log("connnection sucessful");
    })
    .catch((e)=>{
        console.log(e);
    });

io.on("connection", (socket)=>{
    console.log("Connected");
    socket.on("createRoom", async ({nickname})=>{
        try{
            console.log(nickname);
            let room = new Room();
            let player = {
                socketId: socket.id,
                nickname: nickname,
                playerType: 'X'
            };

            room.players.push(player);
            room.turn = player;

            room = await room.save();
            
            const roomID = room._id.toString();
            socket.join(roomID);

            io.to(roomID).emit("createRoomSuccess", room);

        }catch(e){
            console.log(e);
        }
        
    });

    socket.on("joinRoom", async({nickname, roomID})=>{
        try{
            if(!roomID.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit("errorOccurred", "Please enter a valid room ID");
                return;
            }
            let room = await Room.findById (roomID);

            if(room.isJoin){
                let player = {
                    nickname,
                    socketId: socket.id,
                    playerType: "O"
                }
                socket.join(roomID);
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                io.to(roomID).emit("joinSuccess", room);
                io.to(roomID).emit("updatePlayers", room.players);
                io.to(roomID).emit("updateRoom", room);
            }
            else{
                socket.emit("errorOccurred", "Room is full, game in progress");
            }

        }catch(e){
            console.log(e);
        }
    });

    socket.on("tap", async ({index, roomID})=>{
        try{
            let room = await Room.findById(roomID);
            let choice = room.turn.playerType;
            
            if(room.turnIndex ==0){
                room.turnIndex = 1;
                room.turn = room.players[1];
            }
            else{
                room.turnIndex = 0;
                room.turn = room.players[0];
            }
            room = await room.save();
            io.to(roomID).emit("tapped",{
                index,
                choice,
                room
            });
        }catch(e){
            console.log(e);
        }
    });
});


server.listen(port, "0.0.0.0", ()=>{ 
    console.log("server stated on "+port);
});


