//
//  ViewController.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import UIKit

class ViewController: UIViewController {

    var quiz : Quiz = Quiz()
    var quizTracker : QuizTracker = QuizTracker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuestionBankView"{
                        
            let listQuestionsVC = segue.destination as? ListQuestionsViewController
            listQuestionsVC?.quiz = quiz
        }
        
        if segue.identifier == "QuizView"{
                        
            let quizVC = segue.destination as? QuizViewController
            if quizTracker.quiz.noOfQuestions == 0
            {
                let alert = UIAlertController(title: "Error", message: "No questions set", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alert, animated: true)
                return
            }
            quizVC?.quizTracker = quizTracker
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quizTracker = QuizTracker()
        quizTracker.quiz = quiz
        for i in 0..<quiz.noOfQuestions
        {
            quizTracker.answerStatus.append(2)
        }
        quizTracker.noOfQuestions = quiz.noOfQuestions
    }


}

	
