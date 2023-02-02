//
//  StartPresenter.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 01.02.2023.
//

import UIKit

protocol StartPresenterProtocol: AnyObject {
    init(view: StartViewProtocol, parser: ParseServiceProtocol, router: RouterProtocol)
    var router: RouterProtocol { get set }
    var quiz: Quiz? { get set }
    func getQuiz()
}

class StartPresenter: StartPresenterProtocol {
    var router: RouterProtocol
    var view: StartViewProtocol?
    var parser: ParseServiceProtocol?
    var quiz: Quiz?
    
    required init(view: StartViewProtocol, parser: ParseServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.parser = parser
    }
    
    func getQuiz() {
        parser?.getQuiz(completion: { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let quiz):
                self?.quiz = quiz
                self?.view?.success()
            case .failure(let error):
                self?.view?.failure(error: error)
            }
        })
    }
}
