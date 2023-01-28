//
//  ParseService.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import Foundation

protocol ParseServiceProtocol {
    func getQuestions()
}

class ParseService {
    
    var quiz: Quiz?
    
    func getQuiz() {
        guard let path = Bundle.main.path(forResource: "ExampleJSON", ofType: "json") else { return }
        
        do {
            guard let jsonData = try String(contentsOfFile: path).data(using: .utf8) else { return }
            quiz = try JSONDecoder().decode(Quiz.self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
