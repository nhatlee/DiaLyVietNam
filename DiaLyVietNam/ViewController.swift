//
//  ViewController.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listLessons: UITableView!
    let listChapters = dummyData()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listChapters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let chapter = listChapters[section]
        return chapter.lessons.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.blue
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let chapter = listChapters[section]
        return chapter.name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath) as! LessonCell
        let chapter = listChapters[indexPath.section]
        let lesson = chapter.lessons[indexPath.row]
        cell.loadCell(lesson: lesson)
        return cell
    }
}

