//
//  Question.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import Foundation


class Question{
    var question : String
    var options: [String] = []
    var correctOption : String
    var noOfOptions : Int = 4
    init() {
        self.question = ""
        self.options = ["", "", "", ""]
        self.correctOption = ""
        self.noOfOptions = 4
    }
}
