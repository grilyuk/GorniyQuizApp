//
//  StartViewController.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import UIKit

protocol StartViewProtocol: AnyObject {
    func success() 
    func failure(error: Error)
}

class StartViewController: UIViewController {
    
    //MARK: Properties
    let startButton = UIButton(type: .system)
    let welcomeLabel = UILabel()
    let logoView = UIImageView()
    var presenter: StartPresenterProtocol!
    
    
    //MARK: UI constants
    enum UIConstants {
        static let widthStartButton: CGFloat = 200
        static let centerButtonToTopSafeArea: CGFloat = -150
        static let topLabelToTopSafeArea: CGFloat = 100
        static let logoImageToTopSafeArea: CGFloat = 300
        static let buttonTitleFontSize: CGFloat = 40
        static let bgColor = CGColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: Set UI
    func setupUI() {
        view.backgroundColor = .init(cgColor: UIConstants.bgColor)
        view.addSubview(startButton)
        view.addSubview(welcomeLabel)
        view.addSubview(logoView)
        setStartButton()
        setWelcomeLabel()
        setLogoView()
    }
    
    func setWelcomeLabel() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
        welcomeLabel.text = "Welcome!"
        welcomeLabel.font = welcomeLabel.font.withSize(40)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.topLabelToTopSafeArea)
        ])
    }
    
    func setStartButton() {
        startButton.titleLabel?.font = startButton.titleLabel?.font.withSize(UIConstants.buttonTitleFontSize)
        startButton.sizeToFit()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Let\'s test!", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .systemGreen
        startButton.layer.cornerRadius = startButton.frame.height/2
        startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: UIConstants.centerButtonToTopSafeArea),
            startButton.widthAnchor.constraint(equalToConstant: UIConstants.widthStartButton)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        presenter.getQuiz()
        presenter.router.showQuiz(quiz: presenter.quiz)
    }
    
    func setLogoView() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.image = UIImage(named: "LogoGorniy")
        
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.logoImageToTopSafeArea)
        ])
    }
}

//MARK: ConfirmProtocol
extension StartViewController: StartViewProtocol {
    func success() {
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
