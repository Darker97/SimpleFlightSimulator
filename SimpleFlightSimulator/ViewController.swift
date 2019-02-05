//
//  ViewController.swift
//  SimpleFlightSimulator
//
//  Created by Christian Baltzer on 04.06.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FlughöheDisplay: UILabel!
    @IBOutlet weak var GeschwindigkeitDisplay: UILabel!
    @IBOutlet weak var FlugzeitDisplay: UILabel!
    @IBOutlet weak var CrashBild: UIImageView!
    @IBOutlet weak var Geschwindigkeit: UISlider!
    
    @IBAction func GeschwindigkeitRegler(_ sender: Any) {
        var IntValue: Int = Int (Geschwindigkeit.value)
        timer.updateGeschwindigkeit(a: IntValue)
    }
    

    
    
    
    var timer = FlightTimer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = FlightTimer(withLabel: FlugzeitDisplay, withLabel: GeschwindigkeitDisplay, withLabel: FlughöheDisplay, withImage: CrashBild)
        
    }
    @IBAction func StartButton(_ sender: Any) {
        timer.start()
    }
    
    @IBAction func ClearButton(_ sender: Any) {
        timer.stop()
        timer.clear()
    }
    @IBAction func StopButton(_ sender: Any) {
        timer.stop()
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

