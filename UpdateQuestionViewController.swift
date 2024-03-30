//
//  UpdateQuestionViewController.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import UIKit


protocol UpdateQuestionDelegate {
    func editQuestionDidFinished(updatedQuestion : Question, selectedIndex : Int)
    func editQuestionDidCanceled()
}

class UpdateQuestionViewController: UIViewController {

    var updatedQuestion : Question = Question()
    var delegate : UpdateQuestionDelegate?
    var selectedQuestion : Question = Question()
    var selectedIndex : Int = 0
    @IBAction func save(_ sender: Any) {
        
        updatedQuestion.noOfOptions =  4
        updatedQuestion.question = questionText.text
        updatedQuestion.correctOption = answerText.text
        updatedQuestion.options[0] = answerText.text
        updatedQuestion.options[1] = option1Text.text
        updatedQuestion.options[2] = option2Text.text
        updatedQuestion.options[3] = option3Text.text
        
        delegate?.editQuestionDidFinished(updatedQuestion: updatedQuestion, selectedIndex: selectedIndex)
        dismiss(animated: true)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.editQuestionDidCanceled()
        dismiss(animated: true)
    }
    
    
    
    @IBOutlet weak var questionText: UITextView!
    
    @IBOutlet weak var answerText: UITextView!
    
    @IBOutlet weak var option1Text: UITextView!
    
    @IBOutlet weak var option2Text: UITextView!
    
    @IBOutlet weak var option3Text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionText.text = selectedQuestion.question
        self.answerText.text = selectedQuestion.correctOption
        
        var wrongAnswers = selectedQuestion.options

        if let index = wrongAnswers.firstIndex(of: selectedQuestion.correctOption) {
            wrongAnswers.remove(at: index)
        }
        self.option1Text.text = wrongAnswers[0]
        self.option2Text.text = wrongAnswers[1]
        self.option3Text.text = wrongAnswers[2]

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
