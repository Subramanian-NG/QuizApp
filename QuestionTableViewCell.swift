//
//  QuestionTableViewCell.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {


    @IBOutlet weak var questionText: UILabel!
    
    
    @IBOutlet weak var answerText: UILabel!
    
    
    @IBOutlet weak var option1Text: UILabel!
    
    
    @IBOutlet weak var option2Text: UILabel!
    
    
    @IBOutlet weak var option3Text: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
