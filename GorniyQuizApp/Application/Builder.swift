//
//  Builder.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 01.02.2023.
//

import UIKit

protocol BuilderProtocol {
    func createStart(router: RouterProtocol) -> UIViewController
    func createQuiz(quiz: Quiz?, router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createStart(router: RouterProtocol) -> UIViewController {
        let view = StartViewController()
        let parser = ParseService()
        let presenter = StartPresenter(view: view, parser: parser, router: router)
        view.presenter = presenter
        return view
    }
    
    func createQuiz(quiz: Quiz?, router: RouterProtocol) -> UIViewController {
        let parser = ParseService()
        let view = QuizViewController()
        let score = 0
        let presenter = QuizPresenter(view: view, parser: parser, score: score, router: router)
        view.presenter = presenter
        return view
    }
    
}
