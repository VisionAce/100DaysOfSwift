//
//  ViewController.swift
//  Project2
//
//  Created by 褚宣德 on 2023/10/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    
    var contries = [String]()
    var score = 0
    var correctAnswer = 0
    var currentRound = 0
    let endGameRound = 10
    var alterMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        contries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: contries[0]), for: .normal)
        button2.setImage(UIImage(named: contries[1]), for: .normal)
        button3.setImage(UIImage(named: contries[2]), for: .normal)
        
        title = contries[correctAnswer].uppercased() + "   Score:\(score) / 10"
        
        currentRound = currentRound == endGameRound ? 1 : currentRound + 1
        alterMessage = currentRound == endGameRound ? "Restart" : "Continue"
        
   
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Round\(currentRound)\n\n⭕️ Correct\n"
            score += 1
        } else {
            title = "Round\(currentRound)\n\n❌ Wrong\nThat’s the flag of \(contries[sender.tag])\n"
          
        }
            
        let ac = UIAlertController(title: title, message: currentRound == endGameRound ? "🎉Good Game🎉\n\nFinal score is \(score) / 10" : "Your score is \(score) / 10", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: alterMessage, style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
        if currentRound == endGameRound {
            score = 0
        }
        
    }
    

}



