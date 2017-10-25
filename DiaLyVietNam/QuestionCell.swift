//
//  QuestionCell.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/25/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
protocol CellDelegate: class {
    func nextAction()
//    func previous()
//    func tapAns(an: Answer?, buttonTap: UIButton)
}
final class QuestionCell: UICollectionViewCell {
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var btnDoAgain: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var lblAn4: UILabel!
    @IBOutlet weak var lblAn3: UILabel!
    @IBOutlet weak var lblAn2: UILabel!
    @IBOutlet weak var lblAn1: UILabel!
    let COLOR = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
    weak var delegate: CellDelegate?
    var currentQues: Question?
    private var selectedAn: Answer?
    let ImageTag = 100
//    private var isEndIndex = false
    
    func loadCell(ques: Question, isEndList: Bool) {
        if isEndList{
            btnNext.setTitle("Xong", for: .normal)
            btnNext.isEnabled = false
        }
        
        currentQues = ques
        lblQuestion.text = ques.content
        var resultSet = Set<Int>()
        while resultSet.count < 4 {
            let randomIndex = Int(arc4random_uniform(UInt32(4)))
            resultSet.insert(randomIndex)
        }
        for (index, value) in resultSet.enumerated(){
            switch index {
            case 0:
                lblAn1.text = ques.answers[value].content
            case 1:
                lblAn2.text = ques.answers[value].content
            case 2:
                lblAn3.text = ques.answers[value].content
            case 3:
                lblAn4.text = ques.answers[value].content
            default:
                break
            }
        }
    }
    
    
    @IBAction func anTap(_ sender: UIButton) {
        resetAn(isEnable: false)
        guard let curLabel = self.viewWithTag((sender.tag * 10)) as? UILabel,
        let ques = currentQues else{ return }
        let text = curLabel.text
        selectedAn = ques.answers.filter{$0.content == text}.first
        selectedAn?.isSelected = true
        sender.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        addImage(to: sender)
    }
    
    func addImage(to button: UIButton){
        let imageView = UIImageView(frame: CGRect(x: button.frame.size.width/2 - 40, y: button.frame.size.height/2 - 40 + 3, width: 80, height: 80))
        imageView.tag = ImageTag
        let imageName = selectedAn?.isCorrect == true ? "correct" : "Incorrect"
        imageView.image = UIImage(named: imageName)
        imageView.layer.zPosition = 1
        let _color = selectedAn?.isCorrect == true ? UIColor.clear : UIColor.red
        btnDoAgain.backgroundColor = _color
        button.addSubview(imageView)
    }
    
    func resetAn(isEnable: Bool){
        btnDoAgain.backgroundColor = UIColor.clear
        let image = self.viewWithTag(ImageTag)
        image?.removeFromSuperview()
        btn1.backgroundColor = COLOR
        btn2.backgroundColor = COLOR
        btn3.backgroundColor = COLOR
        btn4.backgroundColor = COLOR
        btn1.isEnabled = isEnable
        btn2.isEnabled = isEnable
        btn3.isEnabled = isEnable
        btn4.isEnabled = isEnable
    }
    @IBAction func doAgain(_ sender: Any) {
        resetAn(isEnable: true)
    }
    
    @IBAction func next(_ sender: Any) {
        resetAn(isEnable: true)
        self.delegate?.nextAction()
    }
    
//    @IBAction func previous(_ sender: Any) {
////        resetAn(isEnable: true)
//        self.delegate?.previous()
//    }
    
}
