
#  QuizAkrobat Template

  

## Add QuizAkrobat Template

  

Add the QuizAkrobat Package using File->Add Package Dependencies... and the link https://github.com/ByteHoodie/QuizAkrobat

  

## QuizHomeController

  

This is the starting point of the app, which shows by default the four buttons Practice Mode, Test, Statistics and Tipps and tricks. Some functions that could be usefull

  
  

    func initViewController()
    
    // Handle Practice Button
    func practiceButtonPressed(_ sender: Any)
    func practiceModeSelected(difficulty: DifficultyLevel)
    
    // Handle TestButton
    func testButtonPRessed(_ sender: Any)
    func testModeSelected

    func showStatistics()
    func tipssSelected()
  

  

## Storyboard

  

Add the created Home Controller as the View Controller of the view in the storyboard and also embed it in a navigation controller.

## QuizGameViewController

The view controller that handles the actual quiz. Some important functions and properties are: 

    var gameView: QuizQuestionView
    initQuiz() // Setup everythin needed
    modalCallback() // When the modal to finish practice session is accepted


In the function initQuiz the buttons, gameView and questionDatasource must be set! E.g.

    var gameView: QuizQuestionView =         QuizQuestionView()
    
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

        questionDataSource.recipeConstructor = DataSource()
        questionView = gameView

    }

## QuizQuestionView

The view which is used in the quiz to display the question. Important functions: 

    setupView()
    setQuestion<A,Q>(question: QuizQuestion<A,Q>)
    showHelp<A,Q>(question: QuizQuestion<A,Q>)
    func removeHelp()

## GameViewButton

The button that shows the answers

       override func commonInit()
       override func setAnswers<Q>(anser:Q)
       override func setTextNoneOfTheAnswers()


## Recipes

To implement the recipes and provide the quiz with them, implement a class the inherits from RecipeConstructor<AnswerType, QuizType>. Some usefull functions

    func getRecipe(difficulty: DifficultyLevel) -> QuizQuestion<AnswerType, QuizType> 
    func getTestQuestions() -> [QuizQuestion<AnswerType, QuizType>]
    func getHintTextForRecipeNumber(currentRecipeNumber: Int) -> String?

## AnswerType and QuizType

Two classes that are necessary for the Quiz are *QuizType* and *AnswerType* that have to inherit from *NSObject*. For convenience a typealias could be definied 

    typealias  Question = QuizQuestion<AnswerType, QuizType>
