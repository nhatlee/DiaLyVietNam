//
//  ViewController.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let SEGUES_STRING = "ShowPdf"
    private var selectedFile: String?
    @IBOutlet weak var listLessons: UITableView!
    let listChapters = prepareChapterData()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ĐỊA LÍ VIỆT NAM"
        // Do any additional setup after loading the view, typically from a nib.
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listChapters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let chapter = listChapters[section]
        return chapter.subChapter.lesson.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 1.0
        }
        let chapter = listChapters[section]
        if chapter.subChapter.name.count > 0{
            return 70
        }
        return 60
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return nil
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        let label = UILabel(frame: CGRect(x: 5, y: 5, width: tableView.frame.size.width, height: 18))
        label.textColor = UIColor.blue
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
        let chapter = listChapters[section]
        label.text = chapter.name
        label.numberOfLines = 0
        label.sizeToFit()
        if chapter.subChapter.name.count > 0{
            var frame = view.frame
            frame.size.height = 70
            view.frame = frame
           let subLabel = UILabel(frame: CGRect(x: 5, y: 5 + 18 + 10, width: tableView.frame.size.width, height: 40))
            let string = String(chapter.subChapter.name.dropFirst())
            subLabel.text = string
            view.addSubview(subLabel)
            subLabel.textColor = UIColor.blue
            subLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            subLabel.numberOfLines = 0
        } else {
            var frame = label.frame
            frame.origin.y = 30 - 15
            label.frame = frame
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath) as! LessonCell
        let chapter = listChapters[indexPath.section]
        let lesson = chapter.subChapter.lesson[indexPath.row]
        cell.loadCell(lesson: lesson)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chapter = listChapters[indexPath.section]
        let lesson = chapter.subChapter.lesson[indexPath.row]
        if let path = Bundle.main.path(forResource: lesson.fileNamePdf, ofType: "pdf"){
            selectedFile = path
        self.performSegue(withIdentifier: SEGUES_STRING, sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUES_STRING {
            let VC = segue.destination as! PDFViewerVC
            VC.pdfFileName = selectedFile
        }
    }
}

