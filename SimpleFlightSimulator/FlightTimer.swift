//
//  FlightTimer.swift
//  SimpleFlightSimulator
//
//  Created by Christian Baltzer on 05.06.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
import UIKit

class FlightTimer {
    
    //Variables
    var FlughöheDisplay = UILabel()
    var GeschwindigkeitDisplay = UILabel()
    var FlugzeitDisplay = UILabel()
    var Crasch = UIImageView()
    var timer = Timer()
    var 😋 = 5
    
    var Minutes = 0 { willSet{FlugzeitDisplay.text = "\(newValue)"}}
    var TimeasString = ""
    
    var FlughöheasString = ""
    var Flughöhe = 0 { willSet{FlughöheDisplay.text = "\(newValue)"}}
    
    var Geschwindigkeit = 0 { willSet{GeschwindigkeitDisplay.text = "\(newValue)"}}
    var GeschwindigkeitAsString = ""
    
    var isRunning = false
    
    //Initialisieren
    init (){
    }
    
    init(withLabel label1: UILabel, withLabel label2: UILabel, withLabel Label3: UILabel, withImage Image1: UIImageView){
        FlugzeitDisplay = label1
        GeschwindigkeitDisplay = label2
        FlughöheDisplay = Label3
        Crasch = Image1
    }
    
    //Methods
    @objc func updateTimer(){
        Minutes += 1
        Flughöhe += Geschwindigkeit-10
        if (Flughöhe <= 0) {
            Crasch.isHidden = false
            timer.invalidate()
        }
    }
}

//TimerControll
extension FlightTimer {
    
    func start(){
        if (Minutes == 0){
            Flughöhe = 10
            Geschwindigkeit = 10
        }
        isRunning = true
        let selector = #selector(FlightTimer.updateTimer)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: selector, userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func stop(){
        isRunning = false
        timer.invalidate()
    }
    
    func clear(){
        Crasch.isHidden = true
        Minutes = 0
        Flughöhe = 10
        Geschwindigkeit = 10
    }
    
    func updateGeschwindigkeit(a: Int){
        Geschwindigkeit = a
    }
}

