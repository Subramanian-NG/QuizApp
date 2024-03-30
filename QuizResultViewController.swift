//
//  QuizResultViewController.swift
//  QuizApp
//
//  Created by user238111 on 3/29/24.
//

import UIKit

class QuizResultViewController: UIViewController {

    var quizTracker : QuizTracker = QuizTracker()
    
    @IBOutlet weak var scoreText: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let onesCount = quizTracker.answerStatus.filter { $0 == 1 }.count
        let percentageDouble: Double = (Double(onesCount) / Double(quizTracker.noOfQuestions)) * 100
        var scoreString: String

        if percentageDouble == Double(Int(percentageDouble)) {
            scoreString = String(format: "%.0f", percentageDouble)
        } else {
            scoreString = String(format: "%.2f", percentageDouble)
        }
        scoreText.text = scoreString + " %"
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
