//
//  QuizTracker.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import Foundation

class QuizTracker
{
    var quiz : Quiz
    var answerStatus = [Int]() // 0-wrong, 1-right, 2-not answered
    var score : Int = 0
    var noOfQuestions : Int = 0
    var currentQuestionNumber : Int = 0
    init() {
        self.quiz = Quiz()
        self.answerStatus = []
        self.score = 0
        self.noOfQuestions = 0
        self.currentQuestionNumber = 0
    }
    
}
