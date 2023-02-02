//
//  QuizPresenter.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 31.01.2023.
//

import Foundation

protocol QuizPresenterProtocol: AnyObject {
    init(view: QuizViewProtocol, score: Int, router: RouterProtocol, quiz: Quiz)
    var router: RouterProtocol { get set }
    var quiz: Quiz? { get set }
    var score: Int { get set }
}

class QuizPresenter: QuizPresenterProtocol {
    
    var view: QuizViewProtocol?
    var router: RouterProtocol
    var quiz: Quiz?
    var score: Int
    
    required init(view: QuizViewProtocol, score: Int, router: RouterProtocol, quiz: Quiz) {
        self.view = view
        self.quiz = quiz
        self.score = score
        self.router = router
    }
}
