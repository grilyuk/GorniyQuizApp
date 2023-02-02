//
//  Router.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 01.02.2023.
//

import UIKit

protocol MainRouter {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilder? { get set }
}

protocol RouterProtocol: MainRouter {
    func initianalViewController()
    func showQuiz(quiz: Quiz?)
    func showResult(score: Int, numberQuestion: Int)
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilder?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilder) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initianalViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = moduleBuilder?.createStart(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showQuiz(quiz: Quiz?) {
        if let navigationController = navigationController {
            guard let quizViewController = moduleBuilder?.createQuiz(quiz: quiz, router: self) else { return }
            navigationController.pushViewController(quizViewController, animated: true)
        }
    }
    
    func showResult(score: Int, numberQuestion: Int) {
        if let navigationController = navigationController {
            guard let resultViewController = moduleBuilder?.createResult(score: score, numberQuestion: numberQuestion, router: self) else { return }
            navigationController.pushViewController(resultViewController, animated: true)
        }
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}
