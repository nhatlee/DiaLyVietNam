//
//  LessonViewModel.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//



import Foundation
func dummyData() -> [Chapter]{
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

