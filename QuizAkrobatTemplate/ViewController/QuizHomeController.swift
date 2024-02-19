//
//  HomeController.swift
//  QuizAkrobatTemplate
//
//  Created by Konstantin Beiser on 15.02.24.
//

import Foundation
import QuizAkrobat
import UIKit

class QuizHomeController: HomeViewController{
    
    override func initViewController() {
        gradientInformation = GradientInformation(colors:  [UIColor(netHex: 0x37ABCB).cgColor, UIColor(netHex: 0x285d80).cgColor], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5))
    }
    
    override func practiceModeSelected(difficulty: DifficultyLevel) {
        let vc = QuizGameViewController()
        vc.difficulty = difficulty
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func testModeSelected() {
        let vc = QuizGameViewController()
        vc.difficulty = .Test
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
