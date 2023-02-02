//
//  ResultPresenter.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 02.02.2023.
//

import Foundation

protocol ResultPresenterProtocol {
    init(view: ResultViewProtocol, score: Int, numberQuestion: Int, router: RouterProtocol)
    var score: Int { get set }
    var numberQuestion: Int { get set }
    func setResult(score: Int, numberQuestion: Int) -> String
}

class ResultPresenter: ResultPresenterProtocol {

    var score: Int
    var view: ResultViewProtocol?
    var numberQuestion: Int
    var router: RouterProtocol?
    
    required init(view: ResultViewProtocol, score: Int, numberQuestion: Int, router: RouterProtocol) {
        self.score = score
        self.numberQuestion = numberQuestion
        self.view = view
        self.router = router
    }
    
    func setResult(score: Int, numberQuestion: Int) -> String {
        return "Your result \(score)/\(numberQuestion)"
    }
}
