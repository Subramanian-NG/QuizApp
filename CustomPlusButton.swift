//
//  CustomPlusButton.swift
//  QuizApp
//
//  Created by user238111 on 3/28/24.
//

import UIKit

class CustomPlusButton: UIBarButtonItem {
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let plusButton = UIButton(type: .custom)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .white
        plusButton.backgroundColor = .black
        plusButton.layer.cornerRadius = 5
        plusButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        self.customView = plusButton
        
        
    }
    
}
