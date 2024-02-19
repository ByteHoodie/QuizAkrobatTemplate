//
//  QuizGameViewController.swift
//  QuizAkrobatTemplate
//
//  Created by Konstantin Beiser on 15.02.24.
//

import QuizAkrobat
import UIKit
import RealmSwift

class QuizGameViewController: QuizViewController<AnswerType, QuizType>{
    var gameView: QuizQuestionView = QuizQuestionView()
    
    override func initQuiz() {
        
        btn1 = GameViewButton()
        btn1.tag = 0

        btn2 = GameViewButton()
        btn2.tag = 1

        btn3 = GameViewButton()
        btn3.tag = 2

        btn4 = GameViewButton()
        btn4.tag = 3

        btn5 = GameViewButton()
        btn5.tag = 4
        
        questionDataSource.recipeConstructor = Recipes()
        questionView = gameView
    }
    
    override func modalCallback() {
        let vc = SessionSummaryViewController()
        var questions = questionDataSource.questions
        if questions.last?.questionState == .NotAnswered{
            questions.removeLast()
        }
        
        let sessionStats = questions.getSessionStats(difficulty: difficulty)
        let xp = XpHandler.shared.calculateNewXpFromQuestions(questions: questions, difficulty: difficulty)
        let sess = Session(difficulty: difficulty,
                           date: Date(),
                           time: Int(Date()
                            .timeIntervalSince(sessionStartDate)),
                           sessionStats: sessionStats,
                           newXp: xp)
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(sess)
        }
        
//        vc.ranOutOfCoins = ranOutOfCoins
        vc.questions = questions
        vc.session = sess
        self.navigationController?.pushViewController(vc, animated: true)
        self.dismiss(animated: false)

    }
}
