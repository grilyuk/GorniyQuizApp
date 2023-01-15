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
    
    var result: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.numberOfLines = 0
        initialize()
        getQuiz()
    }
    
    func getQuiz() {
        guard let path = Bundle.main.path(forResource: "ExampleJSON", ofType: "json") else { return }
        
        do {
            guard let jsonData = try String(contentsOfFile: path).data(using: .utf8) else { return }
            result = try JSONDecoder().decode(Question.self, from: jsonData)
            self.questionLabel.text = result?.question
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func initialize() {
        self.quizTableView.delegate = self
        self.quizTableView.dataSource = self
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
        cell.textLabel?.text = "test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
