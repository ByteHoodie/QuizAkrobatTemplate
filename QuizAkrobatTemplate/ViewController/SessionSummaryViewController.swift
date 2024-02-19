//
//  SessionSummary.swift
//  QuizAkrobatTemplate
//
//  Created by Konstantin Beiser on 15.02.24.
//

import UIKit
import Stevia
import RealmSwift
import QuizAkrobat

struct SessionSummaryLabelList : Equatable {
    var totalQuestions : LabelListTuple = LabelListTuple(title: "Beantwortete Fragen", value: "0")
    var highscore : LabelListTuple = LabelListTuple(title: "Längster Streak", value: "0")
    var tipps : LabelListTuple = LabelListTuple(title: "Verwendete Tipps", value: "0")
    var totalTime : LabelListTuple = LabelListTuple(title: "Zeit Gesamt", value: "00s")
    var timePerQuestions : LabelListTuple = LabelListTuple(title: "Zeit pro Frage", value: "0.0s")
    var xp : LabelListTuple = LabelListTuple(title: "Erspielte XP", value: "0")
}


class SessionSummaryViewController : BaseSessionSummaryViewController<AnswerType, QuizType, SessionSummaryLabelList> {

    
    override func  setLabelList(answeredQuestions: Int, correctAnswers: Int, tipps : Int, xp: Float){
        
        var labels = SessionSummaryLabelList()
        
        if(answeredQuestions != 0){
            labels.totalQuestions.value = "\(answeredQuestions)"
            labels.totalTime.value = session.totalTime.secondsToString()
            labels.tipps.value = "\(tipps)"
            labels.timePerQuestions.value = String(format: "%.1f", Double(session.totalTime) / Double(answeredQuestions)) + "s"
            labels.highscore.value = "\(session.highscore)"
            labels.xp.value = "\(xp)"
//            self.progress = CGFloat(Double(stats.numberOfCorrectAnswers) / Double(stats.numberOfQuestionsAnswered) * 100 )
        }
        
        
        switch session.difficultLevel{
        case .PracticeEasy, .PracticeMedium:
            labelList.setLabel(labels: labels)
        case .PracticeHard:
            labelList.setLabel(labels: labels, ignoredProperties: [\.tipps])
        case .Test:
            labels.highscore.title = "Richtig Beantwortet"
            labelList.setLabel(labels: labels, ignoredProperties: [\.tipps, \.totalQuestions])
        case .Survival:
            labels.highscore.title = "Punkte"
            labelList.setLabel(labels: labels, ignoredProperties: [\.tipps])
        case .TimeTrail:
            labels.highscore.title = "Punkte"
            labelList.setLabel(labels: labels)
        }
    
        if(answeredQuestions == 0){
            self.progress = 0
        }else{
            self.progress = CGFloat(correctAnswers)  / CGFloat(answeredQuestions) * 100
        }
    }
    
    override func questionHistoryPressed(){
//        let vc = HistoryTableViewController()
//        vc.questions = questions
//        self.navigationController?.pushViewController(vc, animated: true)
    }

}

