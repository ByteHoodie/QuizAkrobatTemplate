//
//  QuizQuestionView.swift
//  QuizAkrobatTemplate
//
//  Created by Konstantin Beiser on 15.02.24.
//

import Foundation
import QuizAkrobat
import UIKit
import Stevia

class QuizQuestionView: QuestionView{
    
    var question: Question?
    
    var questionLabel = UILabel()
    
    
    override func setupView() {
        super.setupView()
        subviews(questionLabel)
        questionLabel.centerInContainer()
        
    }
    
    open override func setQuestion<A, Q>(question : QuizQuestion<A, Q>)  where  A: NSObject, Q: NSObject {
        self.question = question as? Question
        if let quizCast =  question.question as? QuizType{
            questionLabel.text = quizCast.questionText
        }
    }
    
    open override func removeHelp() {
        
    }
    
    
}
