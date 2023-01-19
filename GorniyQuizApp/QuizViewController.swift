//
//  QuizViewController.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var quizTableView: UITableView!
    
    
    
    var parseService = Parser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
//        initialize()
//        getQuestion()
    }
    
    
    func getQuestion() {
        questionLabel.numberOfLines = 0
        parseService.getQuiz()
        questionLabel.text = parseService.result?.question
    }
        
    func initialize() {
        self.quizTableView?.delegate = self
        self.quizTableView?.dataSource = self
        quizTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        quizTableView.isScrollEnabled = false
    }
}

extension QuizViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = quizTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = parseService.result?.answers.answer[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
