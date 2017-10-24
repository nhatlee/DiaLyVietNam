//
//  LessonCell.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

class LessonCell: UITableViewCell {

    @IBOutlet weak var lblLessonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCell(lesson: Lesson){
        lblLessonName.text = "Bài: \(lesson.name)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
