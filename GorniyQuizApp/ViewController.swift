//
//  ViewController.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let startButton = UIButton()
    let welcomeLabel = UILabel()
    
    enum UIConstants {
        static let widthStartButton: CGFloat = 80
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(cgColor: CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1))
        view.addSubview(startButton)
        view.addSubview(welcomeLabel)
        setStartButton()
        setWelcomeLabel()
        
    }


    func setWelcomeLabel() {

        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.text = "Welcome! \nLet\'s test!"
        welcomeLabel.font = welcomeLabel.font.withSize(50)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
    
    func setStartButton() {
        
        startButton.sizeToFit()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = .systemBlue
        startButton.layer.cornerRadius = startButton.frame.height/2
        startButton.titleLabel?.font = startButton.titleLabel?.font.withSize(25)
        
        startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.widthAnchor.constraint(equalToConstant: UIConstants.widthStartButton)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        self.navigationController?.pushViewController(QuizViewController(), animated: true)
    }
}

