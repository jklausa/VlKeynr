//
//  ViewController.swift
//  VlKeynr
//
//  Created by Michał Kałużny on 15.11.2014.
//  Copyright (c) 2014 Michał Kałużny. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var button1: VlKeynrButton!
    @IBOutlet weak var button2: VlKeynrButton!
    @IBOutlet weak var button3: VlKeynrButton!
    @IBOutlet weak var button4: VlKeynrButton!
    @IBOutlet weak var button5: VlKeynrButton!
    @IBOutlet weak var button6: VlKeynrButton!
    @IBOutlet weak var button7: VlKeynrButton!
    @IBOutlet weak var button8: VlKeynrButton!
    @IBOutlet weak var buttonRandom: VlKeynrButton!
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

