//
//  ViewController.swift
//  EggTimer
//
//  Created by Sahid Reza on 02/12/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var eggTimerLabel: UILabel!
    
    let eggTypes = ["HARD":5, "Medium": 7 , "Soft" : 10]
    var timer = Timer()
    var totalTime = 0
    var timeIncreasing = 0
    var player: AVAudioPlayer!

    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eggTimerLabel.textColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        timer.invalidate()
        
        let currentEggStatus = sender.titleLabel?.text!
        let currentEggValues = eggTypes[currentEggStatus!]
        totalTime = 0
        timeIncreasing = 0
        totalTime = currentEggValues!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerPorecessing), userInfo: nil, repeats: true)
        
    
        
    }
    
    @objc func timerPorecessing(){
        
        if totalTime > timeIncreasing{
            
            let porgressValue = Float(timeIncreasing + 1) / Float(totalTime)
            
            progressView.progress = porgressValue

            
            timeIncreasing += 1
           
        }
        
        else {
            
            timer.invalidate()
            totalTime = 0
            timeIncreasing = 0
            playSound(soundName: "on_time")
        }
        
    }
    
    func playSound(soundName: String) {
           let url = Bundle.main.url(forResource: soundName, withExtension: ".mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
           
       }
    
}

