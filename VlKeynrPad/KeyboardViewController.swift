//
//  KeyboardViewController.swift
//  VlKeynrPad
//
//  Created by Michał Kałużny on 15.11.2014.
//  Copyright (c) 2014 Michał Kałużny. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardViewController: UIInputViewController {

    let bonanzaBgColor = UIColor(red:0.14118, green:0.18039, blue:0.20392, alpha:1)

    var isActuallyAKeyboard: Bool = true {
      didSet {
        setupGlobeAndBg()
      }
    }

    ///pragma mark - buttons
    @IBOutlet weak var button1: VlKeynrButton!
    @IBOutlet weak var button2: VlKeynrButton!
    @IBOutlet weak var button3: VlKeynrButton!
    @IBOutlet weak var button4: VlKeynrButton!
    @IBOutlet weak var button5: VlKeynrButton!
    @IBOutlet weak var button6: VlKeynrButton!
    @IBOutlet weak var button7: VlKeynrButton!
    @IBOutlet weak var button8: VlKeynrButton!
    @IBOutlet weak var buttonRandom: VlKeynrButton!
    @IBOutlet weak var globeButton: UIButton!

    var audioPlayer: AVAudioPlayer?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "VlKeynrPad", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        view = objects[0] as UIView

        setupSoundButtons()
        setupGlobeAndBg()
    }

    func setupSoundButtons() {
        button1.associatedSound = .SuspenseAccent1
        button2.associatedSound = .SuspenseAccent2
        button3.associatedSound = .SuspenseAccent3
        button4.associatedSound = .SuspenseAccent4
        button5.associatedSound = .SuspenseAccent5
        button6.associatedSound = .SuspenseAccent6
        button7.associatedSound = .SuspenseAccent7
        button8.associatedSound = .SoftMatt
        buttonRandom.associatedSound = VlKeynrSound(rawValue: Int(arc4random_uniform(9)))
    }

    func setupGlobeAndBg() {
      if let view = view {
        if isActuallyAKeyboard {
          view.backgroundColor = bonanzaBgColor
          globeButton.hidden = false
        } else {
          view.backgroundColor = UIColor.clearColor()
          globeButton.hidden = true
        }
      }
    }

    @IBAction func playSound(sender: VlKeynrButton) {
        if let sound = sender.associatedSound {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                self.audioPlayer = sound.play(self.audioPlayer)
            }

            if let url = sound.url() {
                let proxy = textDocumentProxy as UIKeyInput
                proxy.insertText(url)
            }
        }
        
        // Roll new random sound
        buttonRandom.associatedSound = VlKeynrSound(rawValue: Int(arc4random_uniform(9)))
    }

    @IBAction func globeButtonTapped() {
        advanceToNextInputMode()
    }

}


