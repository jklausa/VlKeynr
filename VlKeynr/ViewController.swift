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

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "embedKeyboard" {
        if let dvc = segue.destinationViewController as? KeyboardViewController {
          dvc.isActuallyAKeyboard = false
        }
      }
    }
  
}

