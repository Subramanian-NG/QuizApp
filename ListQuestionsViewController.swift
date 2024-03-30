//
//  ListQuestionsViewController.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import UIKit

class ListQuestionsViewController: UIViewController, AddQuestionDelegate, UpdateQuestionDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var questionsTable: UITableView!
    
    
    var quiz : Quiz = Quiz()
    
    func addQuestionDidFinished(addedQuestion: Question) {
        
        quiz.noOfQuestions = quiz.noOfQuestions + 1
        quiz.questions.append(addedQuestion)
        questionsTable.reloadData()
    }
    
    func addQuestionDidCanceled() {
        
    }
    
    func editQuestionDidFinished(updatedQuestion: Question, selectedIndex: Int) {
        quiz.questions[selectedIndex] = updatedQuestion
        questionsTable.reloadData()
    }

    
    func editQuestionDidCanceled() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddQuestionView"{
                        
            let addQuestionVC = segue.destination as? AddQuestionViewController
            addQuestionVC?.delegate = self
        }
        
        if segue.identifier == "UpdateQuestionView"{	
                        
            let updateQuestionVC = segue.destination as? UpdateQuestionViewController
            
            let selectedIndexPath = questionsTable.indexPathForSelectedRow
            let selectedQuestion = quiz.questions[selectedIndexPath!.row]
            updateQuestionVC?.selectedQuestion = selectedQuestion
            updateQuestionVC?.selectedIndex = selectedIndexPath!.row
            updateQuestionVC?.delegate = self
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quiz.noOfQuestions
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 600.0
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? QuestionTableViewCell
        
        cell?.questionText.text = quiz.questions[indexPath.row].question
        cell?.answerText.text = quiz.questions[indexPath.row].correctOption
        
        var wrongAnswers = quiz.questions[indexPath.row].options

        if let index = wrongAnswers.firstIndex(of: quiz.questions[indexPath.row].correctOption) {
            wrongAnswers.remove(at: index)
        }
        cell?.option1Text.text = wrongAnswers[0]
        cell?.option2Text.text = wrongAnswers[1]
        cell?.option3Text.text = wrongAnswers[2]
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
            questionsTable.reloadData()
        }

}
