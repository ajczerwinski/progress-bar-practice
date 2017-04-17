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
    var seconds = 60
    
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
        seconds = 10
        runTimer()
        
    }
    
    //func progressFormatter(progress: Float) -> String {
    
        //let formatter = NumberFormatter()
        //formatter.maximumFractionDigits = 0
        //let progressPercent: Float = timesTapped * 100
        //let formattedProgress = formatter.string(from: NSNumber(value: progressPercent))
        //return formattedProgress
        
    //}
    
    //func timeFormatter() {
    //}

    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if seconds < 1 {
            //timer.invalidate()
            seconds = 10
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 0
            let progressStatus: Float = 1 - (Float(seconds) * 0.1)
            print("\(progressStatus)")
            let progressPercent: Float = progressStatus * 100
            let formattedProgress = formatter.string(from: NSNumber(value: progressPercent))
            timerLbl.text = "100%"
            timerBar.progress = 1.0
            
            
        } else {
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 0
            let progressStatus: Float = 1 - (Float(seconds) * 0.1)
            print("\(progressStatus)")
            let progressPercent: Float = progressStatus * 100
            let formattedProgress = formatter.string(from: NSNumber(value: progressPercent))
            timerLbl.text = "\(formattedProgress!)%"
            timerBar.progress = progressStatus
            seconds -= 1
        }
    }

}

