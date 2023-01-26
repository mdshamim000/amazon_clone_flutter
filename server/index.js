const express = require("express");
const app = express();
const PORT = 3000;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected to port${PORT}`);
}); // listen host

//0.0.0.0 = localhost for debug

//api
app.get('/',(req, res)=>{
 res.json( {"hello": "Hello"} );
//console.log(`res.json`);
});