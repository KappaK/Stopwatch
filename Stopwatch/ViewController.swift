//
//  ViewController.swift
//  Stopwatch
//
//  Created by Rayne on 11/27/15.
//  Copyright (c) 2015 Kappa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var perfect: UILabel!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(){
        if !timer.valid {
            //If timer isn't working move it.
    
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                target: self,
                selector: Selector("up"),
                userInfo: nil,
                repeats: true
            )
        }
        
    }
    
    
    
    @IBAction func stop(){
        if timer.valid {
            //If timer is working stop it.
            timer.invalidate()
            self.judgement()
        }
        if count >= 9.8 && count <= 10.2{
        perfect.text = String("PERFECT!")
        }
        
    }
    
    @IBAction func reset(){
        if timer.valid {
            self.resetbutton()
            perfect.text = String("")
           
        }
        
        if !timer.valid {
            self.resetbutton()
            perfect.text = String("")
        }
    }
    
    
    func up() {
        //Add 0.01 to count
        count = count + 0.01
        //Display label up to 2 decimals.
        label.text = String(format: "%.2f", count)
    }
    
    func resetbutton() {
        count = 0.0
        label.text = String(format: "%.1f", count)
    }
    
    func judgement() {
        if count >= 4.0 && count <= 6.0{
            perfect.text = String("Too low!")
        }
        if count >= 6.0 && count <= 8.0{
            perfect.text = String("Getting closer!")
        }
        if count >= 12.0 && count <= 14.0{
            perfect.text = String("Thats a bit high!")
        }
        if count >= 14.0 && count <= 16.0{
            perfect.text = String("Thats too high mate!")
        }
    }
    

}

