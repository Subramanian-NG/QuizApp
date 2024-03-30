//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import UIKit

protocol AddQuestionDelegate {
    func addQuestionDidFinished(addedQuestion : Question)
    func addQuestionDidCanceled()
}

class AddQuestionViewController: UIViewController,UITextViewDelegate {
    
    var addedQuestion : Question = Question()
    var delegate : AddQuestionDelegate?
    
    @IBOutlet weak var questionText: UITextView!
    
    @IBOutlet weak var answerText: UITextView!
    
    @IBOutlet weak var option1Text: UITextView!
    
    @IBOutlet weak var option2Text: UITextView!
    
    @IBOutlet weak var option3Text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView(textView: questionText, placeholder: "Enter the question")
        setupTextView(textView: answerText, placeholder: "Enter the answer")
        setupTextView(textView: option1Text, placeholder: "Enter the first wrong option")
        setupTextView(textView: option2Text, placeholder: "Enter the second wrong option")
        setupTextView(textView: option3Text, placeholder: "Enter the third wrong option")
        // Do any additional setup after loading the view.
    }
    
    func setupTextView(textView:UITextView, placeholder:String)
    {
        textView.delegate = self
        textView.text = placeholder
        textView.textColor  = .white
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .white
        {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        addedQuestion.noOfOptions =  4
        addedQuestion.question = questionText.text
        addedQuestion.correctOption = answerText.text
        addedQuestion.options[0] = answerText.text
        addedQuestion.options[1] = option1Text.text
        addedQuestion.options[2] = option2Text.text
        addedQuestion.options[3] = option3Text.text
        
        delegate?.addQuestionDidFinished(addedQuestion: addedQuestion)
            dismiss(animated: true)
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addQuestionDidCanceled()
        dismiss(animated: true)
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
