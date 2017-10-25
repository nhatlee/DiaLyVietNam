//
//  Lesson.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
struct Lesson {
    let name: String
    let fileNamePdf: String
    
}

struct Chapter {
    let name: String
    let subChapter: SubChapter
}

struct SubChapter {
    let name: String
    let lesson: [Lesson]
}


