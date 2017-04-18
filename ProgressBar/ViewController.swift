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
    
    
    var timesTapped: Float = 0.0
    var time: Float = 0.0
    var timer = Timer()
    var hundredths = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timesTapped = 0.0
        self.progressBar.progress = 0.0
        
    }
    
    
    @IBAction func progressBtn(_ sender: UIButton) {
        
        self.timesTapped += 0.1
        
        if self.progressBar.progress == 1.0 {
            self.progressBar.progress = 0.0
            self.timesTapped = 0.0
        }
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        let progressPercent: Float = timesTapped * 100
        let formattedProgress = formatter.string(from: NSNumber(value: progressPercent))
        self.progressLbl.text = "\(formattedProgress!)%"
        self.progressBar.progress = timesTapped
    }
    
    @IBAction func timerBtn(_ sender: UIButton) {
        
        timer.invalidate()
        hundredths = 99
        runTimer()
        
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        
        timer.invalidate()
        
    }

    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer() {
        if hundredths < 1 {
            
            timerLbl.text = "100%"
            timerBar.progress = 1.0
            
        } else if hundredths == 100 {
                
            timerLbl.text = "0%"
            timerBar.progress = 0.0
            hundredths -= 1
            
        
        } else {
            
            timerLbl.text = progressFormatter(progress: Float(hundredths))
            timerBar.progress = updateProgressBar(hundredths: hundredths)
            hundredths -= 1
            
        }
    }
    
    func updateProgressBar(hundredths: Int) -> Float {
        
        let progressStatus: Float = 1 - (Float(hundredths) * 0.01)
        return progressStatus
        
    }
    
    func progressFormatter(progress: Float) -> String {
    
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        let progressStatus: Float = 1 - (Float(hundredths) * 0.01)
        let progressPercent: Float = progressStatus * 100
        let formattedProgress = formatter.string(from: NSNumber(value: progressPercent))
        
        return "\(formattedProgress!)%"
    
    }

}

