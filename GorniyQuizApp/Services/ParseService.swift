//
//  ParseService.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import Foundation

protocol ParseServiceProtocol {
    func getQuiz(completion: @escaping (Result<Quiz?, Error>) -> Void)
}

class ParseService: ParseServiceProtocol {
    
    func getQuiz(completion: @escaping (Result<Quiz?, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "ExampleJSON", ofType: "json") else { return }
        
        do {
            guard let jsonData = try String(contentsOfFile: path).data(using: .utf8) else { return }
            let quiz = try JSONDecoder().decode(Quiz.self, from: jsonData)
            completion(.success(quiz))
        } catch {
            completion(.failure(error))
        }
    }
    
}
