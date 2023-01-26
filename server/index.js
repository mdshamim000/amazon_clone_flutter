const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
//const userRouter = require("./routes/user");
const PORT = 3000;
const app = express();

const dbpass = "samdbRS1";
const dbrl =
  "mongodb+srv://sam0:samdbRS1@cluster0.pigvday.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter); //midware
//app.use(userRouter);
//connected
mongoose
  .connect(dbrl)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
