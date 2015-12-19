'use strict'

var fs = require('fs')
var path = require('path')

var QuestionPath = '../source'
var QuestionDestPath = '../questions'
var questionFiles = fs.readdirSync(QuestionPath)

var TYPES = ['判断', '选择', '回答', '填空']
var TYPE_MAPPING = {
    '判断':'judgment',
    '选择': 'choice',
    '回答': 'reply',
    '填空': 'reply'
}

questionFiles.forEach(function(file){
    var content = fs.readFileSync(path.join(QuestionPath, file), {encoding: 'utf-8'})
    var lines = content.split('\n')
    var question = {}

    question.type = TYPE_MAPPING[file.substring(0,2)]
    question.tag = 'android'
    question.difficulty = 1
    question.from = '网络整理'
    question.description = lines[0]
    lines.shift() //shift description
    lines.shift() //shift empty line
    question.answer = lines.join('\n')
    fs.writeFileSync(path.join(QuestionDestPath, file), render(question), 'utf8')
})

function render(question){
    let tpl =
`- type: ${question.type}
- tag: ${question.tag}
- difficulty:  ${question.difficulty}
- from: ${question.from}

--------

${question.description}

---------

${question.answer}
`
    return tpl
}
