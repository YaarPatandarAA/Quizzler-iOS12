//
//  ViewController.swift
//  Quizzler
//
//  Created by Amarjit SIngh on 29/11/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNum: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag==1 {pickedAnswer=true}
        else if sender.tag==2{pickedAnswer=false}
        
        checkAnswer()
        questionNum += 1
        nextQuestion()
    }
    
    func updateUI() {
        questionLabel.text = allQuestion.list[questionNum].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNum+1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNum+1)
    }

    func nextQuestion() {
        if questionNum <= 12{
            updateUI()
        }
        else{
            let alert = UIAlertController(title: "Awesome!", message: "You finished the quiz. Would you like to resart?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNum].answer
        if correctAnswer == pickedAnswer{
            score+=1
            ProgressHUD.showSuccess("Correct!")
        }
        else{
            ProgressHUD.showError("Wrong!")
        }
    }
    
    func startOver() {
        questionNum = 0
        score = 0
        nextQuestion()
    }
}
