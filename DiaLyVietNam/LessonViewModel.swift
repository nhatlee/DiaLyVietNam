//
//  LessonViewModel.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//



import Foundation
func prepareChapterData() -> [Chapter]{
    var result = [Chapter]()
    do{
        let path = Bundle.main.path(forResource: "PhuLuc", ofType: "txt")
        let content = try String(contentsOfFile: path!, encoding: .utf8)
        let listStringObj = content.components(separatedBy: "\n")
        for (index, string) in listStringObj.enumerated(){
            if string.contains("BÀI") { continue }
            var subString = ""
            var chapterStr = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if let index = string.index(of: ":"){
                chapterStr = string.substring(to: index)
                subString = string.substring(from: index)
            }
            var listLesson = [Lesson]()
            let index2 = index + 1
            for i in index2..<listStringObj.count {
                let obj = listStringObj[i]
                if !obj.contains("BÀI"){
                    break
                }
                let _index = obj.index(of: ":")
                let pdfName = obj.substring(to: _index!)
                let ob = Lesson(name: obj, fileNamePdf: getSpecialFileName(string: pdfName))
                listLesson.append(ob)
            }
            let sub = SubChapter(name: subString, lesson: listLesson)
            let chapter = Chapter(name: chapterStr, subChapter: sub)
            result.append(chapter)
        }
    } catch let err {
        print(err)
    }
    return result
}

func getSpecialFileName(string: String) -> String {
    switch string {
    case "BÀI 9", "BÀI 10":
        return "BÀI 9 VÀ BÀI 10"
    case "BÀI 11", "BÀI 12":
        return "BÀI 11 VÀ BÀI 12"
    case "BÀI 6", "BÀI 7":
        return "BÀI 6 VÀ BÀI 7"
    case "BÀI 4", "BÀI 5":
        return "BÀI 4 VÀ BÀI 5"
    default:
        return string
    }
}


func prepareQuestion() -> [Question]{
    var questions = [Question]()
    do
    {
        let path = Bundle.main.path(forResource: "Questions", ofType: "txt")
        let content = try String(contentsOfFile: path!, encoding: .utf8)
        let listStringObj = content.components(separatedBy: "[<br>]")
        for obj in listStringObj {
            if obj == "\n" || obj == "" {continue}
//            print(obj)
            let quest = parseQuestion(content: obj)
            questions.append(quest)
        }
    }catch let err {
        print(err)
    }
    return questions
}

func parseQuestion(content: String) -> Question{
    let list = content.components(separatedBy: "\n")
    print(list)
    var quesStr = ""
    var listAnser = [Answer]()
    var idx = 0
    for value in list {
        if value == "" {continue}
        idx += 1
        if idx == 1 {
            quesStr = value
        } else {
            let isCorrect = idx == 2
            let an = Answer(content: getAn(value), isCorrect: isCorrect)
            listAnser.append(an)
        }
    }
    let ques = Question(content: quesStr, answers: listAnser)
    return ques
}

func getAn(_ an: String)-> String{
    var list = an.components(separatedBy: " ")
    list.removeFirst()
    return list.joined(separator: " ")
}



















