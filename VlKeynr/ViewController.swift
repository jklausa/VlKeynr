//
//  ViewController.swift
//  VlKeynr
//
//  Created by Michał Kałużny on 15.11.2014.
//  Copyright (c) 2014 Michał Kałużny. All rights reserved.
//

import UIKit
import AVFoundation

let kBonanzaAppStoreLink = "https://itunes.apple.com/us/podcast/bonanza!/id937578527";

class ViewController: UIViewController {

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func openPodcastsApp(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: kBonanzaAppStoreLink)!);
    }
}

