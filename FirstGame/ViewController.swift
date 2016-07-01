//
//  ViewController.swift
//  FirstGame
//
//  Created by Ashley Jain on 13/12/15.
//  Copyright (c) 2015 ashley jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var player1b: UIButton!
    @IBOutlet weak var player2b: UIButton!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var player2final: UILabel!
    @IBOutlet weak var player1final: UILabel!
    @IBOutlet weak var tryAgain: UIButton!
    
    
    var score = 0
    var score_2 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    player2b.transform = CGAffineTransformMakeRotation(3.14)
    score2.transform = CGAffineTransformMakeRotation(3.14)
    player2final.transform = CGAffineTransformMakeRotation(3.14)
    //score_2 = -score
    score1.text = "\(score)"
    score2.text = "\(score_2)"
    firstP()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func player2pressedb(sender: AnyObject) {
        score_2++
        score = -score_2
        score1.text = "\(score)"
        score2.text = "\(score_2)"
        loss()
    }

    @IBAction func player1pressedb(sender: AnyObject) {
        score++
        score_2 = -score
        score1.text = "\(score)"
        score2.text = "\(score_2)"
        loss()
    }
    @IBAction func tryagain(sender: AnyObject) {
        score = 0
        score_2 = 0
        score1.text = "\(score)"
        score2.text = "\(score_2)"
        firstP()
    }
    func loss() {
        if score < -10 {
            secondP()
            player2final.text = "Winner"
            player1final.text = "Loser"
        }
        else if score_2 < -10 {
            secondP()
            player2final.text = "Loser"
            player1final.text = "Winner"
        }
    }
    func secondP() {
        player1b.hidden = true
        player2b.hidden = true
        score2.hidden = true
        score1.hidden = true
        player1final.hidden = false
        player2final.hidden = false
        tryAgain.hidden = false
        tryAgain.center.x = self.view.frame.width + 30
        UIView.animateWithDuration(3.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: nil, animations: ({
            self.tryAgain.center.x = self.view.frame.width / 2
        }), completion: nil)
    }
    func firstP() {
        player1final.hidden = true
        player2final.hidden = true
        tryAgain.hidden = true
        player1b.hidden = false
        player2b.hidden = false
        score2.hidden = false
        score1.hidden = false
    }

}

