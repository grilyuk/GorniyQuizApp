//
//  Model.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import Foundation

struct Question: Decodable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var rightAnswer: String
}
