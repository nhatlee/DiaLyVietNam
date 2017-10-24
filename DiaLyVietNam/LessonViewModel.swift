//
//  LessonViewModel.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
func dummyData() -> [Chapter]{
    var list = [Chapter]()
    for i in 0...20{
        let lesson = Lesson(name: "Đặc điểm nền nông nghiệp nước ta \(i)", filePathPdf: "")
        let lesson2 = Lesson(name: "Vân đề phát triển nông nghiệp \(i)", filePathPdf: "")
        let lesson3 = Lesson(name: "Tổ chức lanh thổ nông nghiêp \(i)", filePathPdf: "")
        let chapter = Chapter(name: "Địa lý kinh tế \(i)", lessons: [lesson, lesson2, lesson3])
        list.append(chapter)
    }
    return list
}
