//
//  QuizPresenter.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 31.01.2023.
//

import Foundation

protocol QuizPresenterProtocol: AnyObject {
    init(view: QuizViewProtocol, parser: ParseServiceProtocol, score: Int, router: RouterProtocol)
    func getQuiz()
    var quiz: Quiz? { get set }
    var score: Int { get set }
}

class QuizPresenter: QuizPresenterProtocol {
    
    var score: Int
    var quiz: Quiz?
    
    var view: QuizViewProtocol?
    var parser: ParseServiceProtocol?
    var router: RouterProtocol?
    
    required init(view: QuizViewProtocol, parser: ParseServiceProtocol, score: Int, router: RouterProtocol) {
        self.view = view
        self.parser = parser
        self.score = score
        self.router = router
        getQuiz()
    }
    
    func getQuiz() {
        parser?.getQuiz(completion: { [weak self] result in
            guard self != nil else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let quiz):
                    self?.quiz = quiz
                    self?.view?.success()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        })
    }
}
