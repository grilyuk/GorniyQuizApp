//
//  Model.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import Foundation

struct Quiz: Decodable {
    var quiz: [Question]
}

struct Question: Decodable {
    var question, correctAnswer: String
    var answers: Answer
}

struct Answer: Decodable {
    var answer: [String]
}
