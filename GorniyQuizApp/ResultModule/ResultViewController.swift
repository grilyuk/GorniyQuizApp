//
//  ResultViewController.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 22.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score = 0
    var numberQuestion = 0
    
    var resultLabel = UILabel()
    var exitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .init(cgColor: CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1))
        view.addSubview(resultLabel)
        view.addSubview(exitButton)
        setResultLabel()
        setExitButton()
    }
    
    func setResultLabel() {
        
        resultLabel.layer.cornerRadius = 10
        resultLabel.layer.masksToBounds = true
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
        resultLabel.text = "Your score \(score)/\(numberQuestion)"
        resultLabel.backgroundColor = .systemGreen
        resultLabel.font = UIFont.systemFont(ofSize: 40)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    func setExitButton() {
        
        exitButton.sizeToFit()
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        exitButton.setTitle("Exit", for: .normal)
        exitButton.setTitleColor(.white, for: .normal)
        exitButton.titleLabel?.font = exitButton.titleLabel?.font.withSize(40)
        exitButton.backgroundColor = .systemGreen
        exitButton.layer.cornerRadius = exitButton.frame.height/2
        exitButton.addTarget(self, action: #selector(exitButtonAction), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            exitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
        ])
    }
    
    @objc func exitButtonAction(sender: UIButton! ) {
        navigationController?.pushViewController(StartViewController(), animated: true)
    }
    
}
