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

    ///pragma mark - buttons
    let nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton


    @IBOutlet weak var button1: VlKeynrButton!
    @IBOutlet weak var button2: VlKeynrButton!
    @IBOutlet weak var button3: VlKeynrButton!
    @IBOutlet weak var button4: VlKeynrButton!
    @IBOutlet weak var button5: VlKeynrButton!
    @IBOutlet weak var button6: VlKeynrButton!
    @IBOutlet weak var button7: VlKeynrButton!
    @IBOutlet weak var button9: VlKeynrButton!
    @IBOutlet weak var button8: VlKeynrButton!

    var audioPlayer: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "VlKeynrPad", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        view = objects[0] as UIView

        setupSoundButtons()
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
    }

    @IBAction func playSound(sender: VlKeynrButton) {
        if let sound = sender.associatedSound {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                self.audioPlayer = sound.play(self.audioPlayer)
            }
        }
        else {
            advanceToNextInputMode()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
