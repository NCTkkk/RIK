// BAI 1

// const { createServer } = require("node:http");
// const fs = require("fs"); 
// const { type } = require("node:os");

// const hostname = "127.0.0.1";
// const port = 3000;
// const server = createServer((req, res) => {
//   // try {
//   //   let readThis = fs.readFileSync("./txt/read-this.txt",
//   //     {encoding:"utf8"},
//   //   );
//   //   console.log(readThis);
//   //   res.setHeader("Content-Type", "text/plain");
//   //   res.end(readThis);
//   // }
//   // catch(err){
//   //   res.statusCode =500;
//   //   res.end("error reading file");
//   // }

//   try {
//     const inputFile = fs.readFileSync("./txt/input.txt",
//       {encoding:"utf8"},
//     );
//     const appendFile = fs.readFileSync("./txt/append.txt",
//       {encoding:"utf8"},
//     );
//     const finalContent = inputFile + "\n" + appendFile;
//     fs.writeFileSync("./txt/final.txt", finalContent,{encoding:"utf8"})
//     res.statusCode=200;
//     res.setHeader("Content-Type", "text/plain");
//     res.end(finalContent);
//   }
//   catch(err){
//     res.statusCode =500;
//     res.end("error reading file");
//     console.error("Error:", err.message);
//   }
// });
// server.listen(port, hostname, () => {
//   console.log(`Server running at http://${hostname}:${port}/`);
// });





// BAI 2
// const { createServer } = require("node:http");
// const fs = require("fs");
// const { type } = require("node:os");
// const { encode } = require("node:punycode");
// const { appendFile } = require("node:fs");

// const hostname = "127.0.0.1";
// const port = 3000;
// const server = createServer((req, res) => {
//   fs.readFile("./txt/input.txt", {encoding:"utf8"}, (err,inputFile)=>{
//     if(err){
//       res.statusCode=500;
//       res.end("lỗi đọc file input");
//       console.error("lỗi: ", err.message);
//       return;
//     }
//     fs.readFile("./txt/append.txt", {encoding:"utf8"}, (err,appendFile)=>{
//       if(err){
//         res.statusCode=500;
//         res.end("lỗi đọc file append");
//         console.error("lỗi: ", err.message);
//         return;
//       }
//       const finalContent = inputFile + "\n" + appendFile;

//       fs.writeFile("./txt/final.txt",finalContent, {encoding:"utf8"}, (err)=>{
//         if(err){
//           res.statusCode=500;
//           res.end("lỗi viết file final");
//           console.error("lỗi: ", err.message);
//           return;
//         }
//         res.statusCode=200;
//         res.setHeader("Content-Type", "text/plain");
//         res.end(finalContent);
//         console.log("successfully !!!");
//       });
//     });
//   });
// });
// server.listen(port, hostname, () => {
//   console.log(`Server running at http://${hostname}:${port}/`);
// });





// BAI 5
// const { createServer } = require("node:http");
// const fs = require("fs");
// const { type } = require("node:os");
// const { encode } = require("node:punycode");
// const { appendFile } = require("node:fs");

// const hostname = "127.0.0.1";
// const port = 3000;
// const server = createServer((req, res) => {
//   res.setHeader("Content-Type","text/html;charset=utf8");
//   if(req.url==="/"){
//     res.end("<h1>this is overview page</h1>")
//   } else if(req.url==="/overview"){
//     const overView = fs.readFileSync("./templates/overview.html",{encoding:"utf8"})
//     res.end(`<h1>${overView}</h1>`);
//   }else if(req.url==="/product"){
//     const producT = fs.readFileSync("./templates/product.html",{encoding:"utf8"})
//     res.end(`<h1>${producT}</h1>`);
//   }
//   else{
//     res.end(`<h1>PAGE NOT FOUND</h1>`);
//   }
// });
// server.listen(port, hostname, () => {
//   console.log(`Server running at http://${hostname}:${port}/`);
// });





// BAI 6
const { createServer } = require("node:http");
const fs = require("fs");

const hostname = "127.0.0.1";
const port = 3000;

const server = createServer((req, res) => {
  res.setHeader("Content-Type","application/json");
  if(req.url==="/"){
    res.setHeader("Content-Type","text/html");
    res.end("<h1>this is overview page</h1>")
  }else if(req.url==="/backup-data"){
    const backupData = fs.readFileSync("./dev-data/backup-data.json",{encoding:"utf8"})
    res.end(backupData);
  }else if(req.url==="/data"){
    const datA = fs.readFileSync("./dev-data/data.json",{encoding:"utf8"})
    res.end(datA);
  }else if(req.url==="/api"){
    const data1 = fs.readFileSync("./dev-data/data.json",{encoding:"utf8"})
    const parseData = JSON.parse(data1);
    console.log("Parse data: ", parseData);
    res.end(JSON.stringify(parseData));
  }else {
    res.statusCode=404;
    res.setHeader("Content-Type","text/plain");
    res.end("not found");
  }
});
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});