//
//  Model.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import Foundation

struct Question: Decodable {
    var question: String
    var rightAnswer: String
    var answers: Answer
}

struct Answer: Decodable {
    var answer: [String]
}
