//
//  ViewController.swift
//  ProgressBar
//
//  Created by Allen Czerwinski on 4/13/17.
//  Copyright © 2017 Allen Czerwinski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var moneyLbl: UILabel!
    
    
    var timesTapped: Float = 0.0
    var timer = Timer()
    var tenths = 100
    var money = 0.0
    //var isManager = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timesTapped = 0.0
        progressBar.progress = 0.0
        
    }
    
    
    @IBAction func progressBtn(_ sender: UIButton) {
        
        timesTapped += 0.1
        
        
        if progressBar.progress == 1.0 {
            money += 1.0
            moneyLbl.text = moneyFormatter(amount: Float(money))
            progressBar.progress = 0.0
            timesTapped = 0.0
        }
        
        progressLbl.text = tapperProgressFormatter(text: timesTapped)
        progressBar.progress = timesTapped
        
    }
    
    @IBAction func timerBtn(_ sender: UIButton) {
        
        timer.invalidate()
        tenths = 100
        runTimer()
        
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        
        timer.invalidate()
        timerLbl.text = "0%"
        timerBar.progress = 0.0
        
    }

    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer() {
        if tenths < 1 {
            
            timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar.progress = updateTimerProgressBar(progress: tenths)
            money += 10
            moneyLbl.text = moneyFormatter(amount: Float(money))
            tenths = 100
            
        } else if tenths == 100 {
                
            timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar.progress = updateTimerProgressBar(progress: tenths)
            tenths -= 1
            
        
        } else {
            
            timerLbl.text = timerProgressFormatter(text: tenths)
            timerBar.progress = updateTimerProgressBar(progress: tenths)
            tenths -= 1
            
        }
    }
    
    func updateTimerProgressBar(progress: Int) -> Float {
        
        let progressStatus: Float = 1 - (Float(tenths) * 0.01)
        return progressStatus
        
    }
    
    func timerProgressFormatter(text: Int) -> String {
    
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        let progressStatus: Float = 1 - (Float(tenths) * 0.01)
        let progressPercent: Float = progressStatus * 100
        let formattedProgress = formatter.string(from: NSNumber(value: progressPercent))
        
        return "\(formattedProgress!)%"
    
    }
    
    func tapperProgressFormatter(text: Float) -> String {
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        let progressStatus: Float = text * 100
        let formattedProgress = formatter.string(from: NSNumber(value: progressStatus))
        
        return "\(formattedProgress!)%"
        
    }
    
    func moneyFormatter(amount: Float) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: amount))!
        
    }

}

