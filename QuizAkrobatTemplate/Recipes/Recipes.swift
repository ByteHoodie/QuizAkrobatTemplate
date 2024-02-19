//
//  Recipes.swift
//  QuizAkrobatTemplate
//
//  Created by Konstantin Beiser on 15.02.24.
//

import Foundation
import QuizAkrobat

class Recipes: RecipeConstructor<AnswerType, QuizType> {
    
    override func getRecipe(difficulty: DifficultyLevel) -> QuizQuestion<AnswerType, QuizType> {
        
        let randomNumber = Int.random(in: 0...4)
        
        return   Question(recipeNumber: randomNumber, question: QuizType(questionText: "Some recipe question number \(randomNumber)"), answers: [
            AnswerType(answerText: "Answer 1"),
            AnswerType(answerText: "Answer 2"),
            AnswerType(answerText: "Answer 3"),
            AnswerType(answerText: "Answer 4"),
            AnswerType(answerText: "Answer 5")
            ], correctAnswer: randomNumber, recipeVariables: [])
    }
    
    override func getTestQuestions() -> [QuizQuestion<AnswerType, QuizType>] {
        var testQuestions: [Question] = []
        
        for i in 0..<10{
            let randomNumber = Int.random(in: 0...4)
            
            testQuestions.append(Question(recipeNumber: randomNumber, question: QuizType(questionText: "Some recipe question number \(randomNumber)"), answers: [
                AnswerType(answerText: "Answer 1"),
                AnswerType(answerText: "Answer 2"),
                AnswerType(answerText: "Answer 3"),
                AnswerType(answerText: "Answer 4"),
                AnswerType(answerText: "Answer 5")
            ], correctAnswer: randomNumber, recipeVariables: []))
        }
        return testQuestions
    }
    
    override func getHintTextForRecipeNumber(currentRecipeNumber : Int) -> String?{
        return "Some random hint textr"
    }
}
