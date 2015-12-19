// 把XXXX-YYYY.md的文件格式转换为YYYY.md

var fs = require('fs')
var path = require('path')

var QuestionPath = '../questions'
var questionFiles = fs.readdirSync(QuestionPath)

questionFiles.forEach(function(file){
    var newFileName = file.split('-')[1]

    fs.renameSync(path.join(QuestionPath, file), path.join(QuestionPath, newFileName))
    console.log('%s -> %s',path.join(QuestionPath, file), path.join(QuestionPath, newFileName))
})
