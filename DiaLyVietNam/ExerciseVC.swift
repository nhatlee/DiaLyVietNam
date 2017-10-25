//
//  ExerciseVC.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class ExerciseVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnLeft1: UIButton!
    @IBOutlet weak var btnLeft2: UIButton!
    @IBOutlet weak var btnRigh1: UIButton!
    @IBOutlet weak var btnRight2: UIButton!
    var listQuestion = [Question]()
    private var currentItem = 0
    @IBOutlet weak var clvQuestion: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ques = prepareQuestion()
        listQuestion = ques[randomPick: 20]
        self.navigationItem.title = "Trắc nghiệm ôn tập"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listQuestion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        let ques = listQuestion[indexPath.item]
        cell.loadCell(ques: ques, isEndList: (indexPath.item == listQuestion.count - 1))
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }

}

extension ExerciseVC : CellDelegate{
    func nextAction() {
        if currentItem >= listQuestion.count { return }
        currentItem = currentItem == (listQuestion.count - 1)  ? (listQuestion.count - 1) : (currentItem + 1)
        guard currentItem <= listQuestion.count else{ return }
        let indexPath = IndexPath(row: currentItem, section: 0)
        clvQuestion.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredVertically, animated: true)
    }
    
//    func previous() {
//        guard currentItem <= listQuestion.count,  currentItem >= 0 else{ return }
//        currentItem = currentItem == 0 ? 0 : (currentItem - 1)
//        let indexPath = IndexPath(row: currentItem, section: 0)
//        clvQuestion.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredVertically, animated: true)
//    }
    
//    func tapAns(an: Answer?, buttonTap: UIButton) {
//        guard let indexPath = self.clvQuestion.indexPathForView(view: buttonTap) else{return }
//        let selectedQ = self.listQuestion[indexPath.item]
//        var tempQ = selectedQ
//        for (index, value) in tempQ.answers.enumerated(){
//            if value.content == an?.content{
//                tempQ.answers[index].isSelected = true
//            } else {
//                tempQ.answers[index].isSelected = false
//            }
//        }
//        self.listQuestion[indexPath.item] = tempQ
//    }
}
