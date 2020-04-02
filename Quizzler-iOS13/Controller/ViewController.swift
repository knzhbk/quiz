//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let answerFlag = quizLogic.answerCheck(userAnswer)
    
        if answerFlag {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizLogic.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2,
                   target: self,
                   selector: #selector(updateUI),
                   userInfo: nil,
                   repeats: false)
    }
    
       @objc func updateUI(){
        
        let answerChoices = quizLogic.getAnswers()
        questionLabel.text = quizLogic.getQuestionText()
        scoreLabel.text = "Score: \(quizLogic.getScore())"
        firstButton.setTitle(answerChoices[0], for: .normal)
        secondButton.setTitle(answerChoices[1], for: .normal)
        thirdButton.setTitle(answerChoices[2], for: .normal)

        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizLogic.getProgress()
    }
}

