//
//  InterfaceController.swift
//  VlKeynr WatchKit Extension
//
//  Created by Michał Kałużny on 18.11.2014.
//  Copyright (c) 2014 Michał Kałużny. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation

class InterfaceController: WKInterfaceController {

    var audioPlayer: AVAudioPlayer?

    @IBAction func fistButonTapped() {
        play(VlKeynrSound.SuspenseAccent1)
    }
    @IBAction func secondbuttonTapped() {
        play(VlKeynrSound.SuspenseAccent2)
    }
    @IBAction func thirdButtonTapped() {
        play(VlKeynrSound.SuspenseAccent3)
    }
    @IBAction func fourthButtonTapped() {
        play(VlKeynrSound.SuspenseAccent4)
    }
    @IBAction func sixthButtonTapped() {
        play(VlKeynrSound.SuspenseAccent5)
    }
    @IBAction func seventhButtonTapped() {
        play(VlKeynrSound.SuspenseAccent6)
    }
    @IBAction func eigthButtonTapped() {
        play(VlKeynrSound.SuspenseAccent7)
    }
    @IBAction func ninthButtonTapped() {
        play(VlKeynrSound.SoftMatt)
    }

    @IBAction func randomButtonTapped() {
        if let sound = VlKeynrSound(rawValue: Int(arc4random_uniform(9))) {
            play(sound)
        }
    }

    private func play(sound: VlKeynrSound) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            self.audioPlayer = sound.play(self.audioPlayer)
        }

    }
}
