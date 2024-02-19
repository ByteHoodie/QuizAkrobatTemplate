//
//  TypeDefinitions.swift
//  QuizAkrobatTemplate
//
//  Created by Konstantin Beiser on 15.02.24.
//

import Foundation
import QuizAkrobat

public class QuizType: NSObject{
    var questionText: String = "Some Question"
    init(questionText: String) {
        self.questionText = questionText
    }
}

public class AnswerType: NSObject{
    var answerText: String = "Some Answer"
    
    init(answerText: String) {
        self.answerText = answerText
    }
}

typealias Question = QuizQuestion<AnswerType, QuizType>
