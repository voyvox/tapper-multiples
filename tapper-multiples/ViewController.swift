//
//  ViewController.swift
//  tapper-multiples
//
//  Created by Craig Newcomb on 3/25/16.
//  Copyright © 2016 CraigNewcomb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // This is supposed to dismiss keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    //Initialize Properties
    
    var multiple = 0
    var maxMultiply = 5
    var timesMultiply = 0
    var sum = 0
    
    // Outlets
    
    @IBOutlet weak var PlayButton: UIButton!

    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var EnterText: UITextField!

    @IBOutlet weak var EquationLabel: UILabel!
    
    @IBOutlet weak var MultiplyButton: UIButton!
    
    
    // Actions
    
    @IBAction func onPlayButtonPressed(sender: AnyObject!) {
        
        if EnterText.text != nil && EnterText.text != "" {
            multiple = Int(EnterText.text!)!
        
            Logo.hidden = true
            TitleLabel.hidden = true
            EnterText.hidden = true
            PlayButton.hidden = true
        
            EquationLabel.hidden = false
            MultiplyButton.hidden = false
            
            updateEquationlabel()
        }
    }
    
    @IBAction func onMultiplyButtonPressed(sender: UIButton!) {
        timesMultiply += 1
        updateEquationlabel()
        sum = sum + multiple
        if isGameOver() {
            restartGame()
        }
    }
    
    func updateEquationlabel() {
        EquationLabel.text = "\(sum) + \(multiple) = \(sum + multiple)"
    }
    
    func restartGame() {
        
        sum = 0
        timesMultiply = 0
        EnterText.text = ""
        
        Logo.hidden = false
        TitleLabel.hidden = false
        EnterText.hidden = false
        PlayButton.hidden = false
        
        EquationLabel.hidden = true
        MultiplyButton.hidden = true
    }
    
    func isGameOver() -> Bool {
        if timesMultiply >= maxMultiply {
            return true
        } else { return false }
    }
}

