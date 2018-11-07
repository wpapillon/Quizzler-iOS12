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
    let ques = Questions()
    var score = 0
    var currentQuestion = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        var pickedAnswer = true
       
        if sender.tag == 0 {
            pickedAnswer = true
        }
        else if sender.tag == 1
        {
            pickedAnswer = false
        }
        checkAnswer(pickedAn: pickedAnswer)
        nextQuestion()
    }
    
    
    func updateUI() {
       questionLabel.text = ques.questions[currentQuestion].questionText
        scoreLabel.text = "Score : \(score)"
        progressLabel.text = "\(currentQuestion+1)/\(ques.questions.count)"
        progressBar.frame.size.width = ((view.frame.size.width)/CGFloat(ques.questions.count))*CGFloat(currentQuestion+1)
    }
    

    func nextQuestion() {
        currentQuestion += 1
        if currentQuestion <= ques.questions.count-1 {
            updateUI()
        }
        else
        {
            let alert = UIAlertController(title: "", message: "You have reach the end of the quiz", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "Restart", style: UIAlertActionStyle.default) { (UIAlertAction) in
                self.startOver()}
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func checkAnswer(pickedAn :Bool) {
        if pickedAn == ques.questions[currentQuestion].answer{
            score += 1
            ProgressHUD.showSuccess("Correct!")
        }
        else{
            ProgressHUD.showError("Oops!")
        }
    }
    
    func startOver() {
        currentQuestion=0
        score=0
        updateUI()
    }
    

    
}
