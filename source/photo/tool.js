"use strict";
const fs = require("fs");
const path = "../../photos";

fs.readdir(path, function (err, files) {
    if (err) {
        return;
    }
    let arr = [];
    (function iterator(index) {
        if (index == files.length) {
            fs.writeFile("data.json", JSON.stringify(arr, null, "\t"));
            console.log('get img success!');
            return;
        }

        fs.stat(path + "/" + files[index], function (err, stats) {
            if (err) {
                return;
            }
            if (stats.isFile()) {
                arr.push(files[index]);
            }
            iterator(index + 1);
        })
    }(0));
});