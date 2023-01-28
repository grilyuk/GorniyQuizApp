//
//  QuizViewController.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import UIKit

class QuizViewController: UIViewController {
    
    let quizTableView = UITableView()
    let questionLabel = UILabel()
    let scoreLabel = UILabel()
    
    var parseService = ParseService()
    
    var numberQuestion = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(cgColor: CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1))
        view.addSubview(quizTableView)
        view.addSubview(questionLabel)
        view.addSubview(scoreLabel)
        parseService.getQuiz()
        setTableView()
        setQuestionLabel()
        setScoreLabel()
    }
    
    func setScoreLabel() {
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Your score \(score)"
        
        NSLayoutConstraint.activate([
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -35)
        ])
    }
    
    func setQuestionLabel() {
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        questionLabel.text = parseService.quiz?.quiz[numberQuestion].question
        
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func setTableView() {
        quizTableView.delegate = self
        quizTableView.dataSource = self
        quizTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        quizTableView.isScrollEnabled = false
        quizTableView.frame = CGRect(x: 0, y: view.frame.maxY/4*3, width: view.frame.width, height: view.frame.height/2)
        quizTableView.backgroundColor = .clear
        quizTableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension QuizViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parseService.quiz?.quiz[numberQuestion].answers.answer.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = quizTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = parseService.quiz?.quiz[numberQuestion].answers.answer[indexPath.row]
        cell.backgroundColor = .systemGreen
        cell.textLabel?.textAlignment = .center
        cell.layer.cornerRadius = cell.frame.height/2
        cell.selectedBackgroundView?.layer.cornerRadius = cell.frame.height/2
        cell.selectionStyle = .blue
        cell.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if numberQuestion < parseService.quiz!.quiz.count - 1 {
            numberQuestion += 1
            if (parseService.quiz?.quiz[numberQuestion-1].answers.answer[indexPath.row]) == parseService.quiz?.quiz[numberQuestion-1].correctAnswer {
                score += 1
                scoreLabel.text = "Your score \(score)"
            }
        } else {
            if (parseService.quiz?.quiz[numberQuestion].answers.answer[indexPath.row]) == parseService.quiz?.quiz[numberQuestion].correctAnswer {
                score += 1
                scoreLabel.text = "Your score \(score)"
            }
            let vc = ResultViewController()
            vc.score = score
            vc.numberQuestion = numberQuestion+1
            self.navigationController?.pushViewController(vc, animated: true)
        }

        questionLabel.text = parseService.quiz?.quiz[numberQuestion].question
        tableView.reloadData()
    }
}
