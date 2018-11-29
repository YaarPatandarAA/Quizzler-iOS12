//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNum: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag==1 {pickedAnswer=true}
        else if sender.tag==2{pickedAnswer=false}
        
        checkAnswer()
        questionNum = questionNum + 1
        nextQuestion()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionNum <= 12{
            questionLabel.text = allQuestion.list[questionNum].questionText
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
            print("You got it")
        }
        else{
            print("Worng!")
        }
    }
    
    
    func startOver() {
        questionNum = 0
        nextQuestion()
    }
    

    
}
