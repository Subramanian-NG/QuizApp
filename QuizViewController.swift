//
//  QuizViewController.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizTracker : QuizTracker = QuizTracker()

    override func viewDidLoad() {
        //intial loading
        super.viewDidLoad()
        
        var currentQuestion : Question = quizTracker.quiz.questions[0]
            				
        currentQuestion.options.shuffle()
        
        questionText.text = "Question : "+currentQuestion.question
        option1Text.text = "A. "+currentQuestion.options[0]
        option2Text.text = "B. "+currentQuestion.options[1]
        option3Text.text = "C. "+currentQuestion.options[2]
        option4Text.text = "D. "+currentQuestion.options[3]
        
        backwardButton.isUserInteractionEnabled = false
        
        quizTracker.currentQuestionNumber = 1
        
        quizTracker.answerStatus[quizTracker.currentQuestionNumber - 1] = 2 //unanswered
        
        if quizTracker.currentQuestionNumber == quizTracker.noOfQuestions
        {
            forwardButton.isUserInteractionEnabled = false;
        }
        
        progressBar.progress = Float(quizTracker.currentQuestionNumber) / Float(quizTracker.noOfQuestions)
        
        
        setupTapGestureRecognizers()
                
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var option1Text: UILabel!
    
    @IBOutlet weak var option2Text: UILabel!
    
    @IBOutlet weak var option3Text: UILabel!
    
    @IBOutlet weak var option4Text: UILabel!
    
    
    @IBOutlet weak var backwardButton: UIButton!
    
    
    @IBOutlet weak var forwardButton: UIButton!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    func setupTapGestureRecognizers() {
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        option1Text.addGestureRecognizer(tapGesture1)

        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        option2Text.addGestureRecognizer(tapGesture2)

        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        option3Text.addGestureRecognizer(tapGesture3)

        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        option4Text.addGestureRecognizer(tapGesture4)


        }

    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        option1Text.backgroundColor = .white
        option2Text.backgroundColor = .white
        option3Text.backgroundColor = .white
        option4Text.backgroundColor = .white

        if let tappedLabel = sender.view as? UILabel {
            tappedLabel.backgroundColor = .green
            
            var currentQuestion : Question = quizTracker.quiz.questions[quizTracker.currentQuestionNumber-1]
            var selectedOption : String = tappedLabel.text!
            if String(selectedOption.dropFirst(3)) ==  currentQuestion.correctOption
            {
                quizTracker.answerStatus[quizTracker.currentQuestionNumber - 1] = 1
                //right
            }
            else
            {
                quizTracker.answerStatus[quizTracker.currentQuestionNumber - 1] = 0 //wrong
            }
        }
    }

    
    
    @IBAction func backward(_ sender: Any) {
        backwardButton.isUserInteractionEnabled = true
        forwardButton.isUserInteractionEnabled = true
        quizTracker.currentQuestionNumber = quizTracker.currentQuestionNumber - 1
        
        progressBar.progress = Float(quizTracker.currentQuestionNumber) / Float(quizTracker.noOfQuestions)
        
        if quizTracker.currentQuestionNumber == 0
        {
            backwardButton.isUserInteractionEnabled = false
        }
        
        var currentQuestion : Question = quizTracker.quiz.questions[quizTracker.currentQuestionNumber-1]
        
        currentQuestion.options.shuffle()
        
        questionText.text = "Question : "+currentQuestion.question
        option1Text.text = "A. "+currentQuestion.options[0]
        option2Text.text = "B. "+currentQuestion.options[1]
        option3Text.text = "C. "+currentQuestion.options[2]
        option4Text.text = "D. "+currentQuestion.options[3]
        
        option1Text.backgroundColor = .white
        option2Text.backgroundColor = .white
        option3Text.backgroundColor = .white
        option4Text.backgroundColor = .white
    }
    
    
    @IBAction func submit(_ sender: Any) {
        
        
    }
    
    
    
    @IBAction func forward(_ sender: Any) {
        backwardButton.isUserInteractionEnabled = true
        forwardButton.isUserInteractionEnabled = true
        
        quizTracker.currentQuestionNumber = quizTracker.currentQuestionNumber + 1
        
        progressBar.progress = Float(quizTracker.currentQuestionNumber) / Float(quizTracker.noOfQuestions)
        if quizTracker.currentQuestionNumber == quizTracker.noOfQuestions
        {
            forwardButton.isUserInteractionEnabled = false;
        }
        
        var currentQuestion : Question = quizTracker.quiz.questions[quizTracker.currentQuestionNumber-1]
        
        currentQuestion.options.shuffle()
        
        questionText.text = "Question : "+currentQuestion.question
        option1Text.text = "A. "+currentQuestion.options[0]
        option2Text.text = "B. "+currentQuestion.options[1]
        option3Text.text = "C. "+currentQuestion.options[2]
        option4Text.text = "D. "+currentQuestion.options[3]
        
        option1Text.backgroundColor = .white
        option2Text.backgroundColor = .white
        option3Text.backgroundColor = .white
        option4Text.backgroundColor = .white
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResultView"{
                        
            let quizResultVC = segue.destination as? QuizResultViewController
            quizResultVC?.quizTracker = quizTracker
        }
        
    }

}
