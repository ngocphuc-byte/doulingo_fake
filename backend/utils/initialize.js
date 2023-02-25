const express = require("express");
const app = express();
const mongoose = require("mongoose");

const MongooseURL =
    "mongodb+srv://ngocphuc:31KO3MAIXZoHVKaa@cluster0.jm3jwgm.mongodb.net/Doulingo?retryWrites=true&w=majority";

const initial = async () => {
    app;
    MongooseURL;
    mongoose.connect(MongooseURL, {
        useNewUrlParser: true,
    });
};

module.exports = initial;