const express = require("express");
const app = express();
const mongoose = require("mongoose");


require('./models/user_model');

const database = require("./utils/database");
const userRouter = require("./router/user_router");
const initial = require("./utils/initialize");


app.use(express.json());
mongoose.set("strictQuery", false);




const Listen_Port = async () => {
    app.get("/", (req, res) => {
        res.send("Welcome to NodeJS");
    });

    app.listen(3000, () => {
        console.log("Listening on port 3000");
    });
};

const middleware = async () => {
    app.use('/doulingo/v1/user', userRouter);
};


initial().then(() => {
    Listen_Port().then(() => {
        middleware().then(() => {
            database();
        });
    });
});
