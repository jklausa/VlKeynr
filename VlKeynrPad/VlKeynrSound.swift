//
//  VlKeynrSound.swift
//  VlKeynr
//
//  Created by Jan Klausa on 15/11/14.
//  Copyright (c) 2014 Michał Kałużny. All rights reserved.
//

import Foundation
import AVFoundation

enum VlKeynrSound : Int {
    case SuspenseAccent1
    case SuspenseAccent2
    case SuspenseAccent3
    case SuspenseAccent4
    case SuspenseAccent5
    case SuspenseAccent6
    case SuspenseAccent7
    case SoftMatt

    func play(audioPlayer: AVAudioPlayer?) -> AVAudioPlayer? {
        if let audioPlayer = audioPlayer {
            audioPlayer.stop()
        }

        if let mediaURL = urlForSound(self) {
            let newAudioPlayer = AVAudioPlayer(contentsOfURL: mediaURL, error: nil)
            newAudioPlayer.prepareToPlay()
            newAudioPlayer.play()
            return newAudioPlayer
        }

        return nil
    }

    func url() -> String? {
        switch self {
        case .SuspenseAccent1: return "http://suspenseaccents.com/1"
        case .SuspenseAccent2: return "http://suspenseaccents.com/2"
        case .SuspenseAccent3: return "http://suspenseaccents.com/3"
        case .SuspenseAccent4: return "http://suspenseaccents.com/4"
        case .SuspenseAccent5: return "http://suspenseaccents.com/5"
        case .SuspenseAccent6: return "http://suspenseaccents.com/6"
        case .SuspenseAccent7: return "http://suspenseaccents.com/7"
        case .SoftMatt: return "http://softmatt.tumblr.com"
        default: return nil
        }
    }
    
    
    private func urlForSound(sound: VlKeynrSound) -> NSURL? {
        func pathForSound(soundName: String) -> String? {
            var cafFile = NSBundle.mainBundle().pathForResource(soundName, ofType: "caf")
            if let file = cafFile {
                return file
            }

            return NSBundle.mainBundle().pathForResource(soundName, ofType: "mp3")
        }

        func urlForFilename(soundName: String) -> NSURL? {
            if let pathForSound = pathForSound(soundName) {
                return NSURL(fileURLWithPath: pathForSound)
            }

            return nil
        }

        switch self {
            case .SuspenseAccent1: return urlForFilename("Suspense Accents 01")
            case .SuspenseAccent2: return urlForFilename("Suspense Accents 02")
            case .SuspenseAccent3: return urlForFilename("Suspense Accents 03")
            case .SuspenseAccent4: return urlForFilename("Suspense Accents 04")
            case .SuspenseAccent5: return urlForFilename("Suspense Accents 05")
            case .SuspenseAccent6: return urlForFilename("Suspense Accents 06")
            case .SuspenseAccent7: return urlForFilename("Suspense Accents 07")
            case .SoftMatt: return urlForFilename("SoftMatt")
            default: return nil
        }
    }
}