//
//  GameViewButton.swift
//  QuizAkrobatTemplate
//
//  Created by Konstantin Beiser on 15.02.24.
//

import UIKit
import QuizAkrobat

class GameViewButton: AnswerButton{
    
    let label: UILabel = UILabel()
    
    override func commonInit() {
        super.commonInit()
        subviews(label)
        label.centerInContainer()
    }
    
    open override func setAnswers<Q>(answer : Q) where Q: NSObject{
//        print("Set answer Zahlenakrobat")
        let answerCast = answer as? AnswerType
        label.text = answerCast?.answerText
        
    }
    
    override open func setTextNoneOfTheAnswers(){
        label.text = "Keine der Antworten"
    }
}

