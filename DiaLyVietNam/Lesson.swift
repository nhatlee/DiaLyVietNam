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
    let filePathPdf: String
    
}

struct Chapter {
    let name: String
    let lessons: [Lesson]
}
