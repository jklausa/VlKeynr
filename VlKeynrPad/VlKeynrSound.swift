//
//  VlKeynrSound.swift
//  VlKeynr
//
//  Created by Jan Klausa on 15/11/14.
//  Copyright (c) 2014 Michał Kałużny. All rights reserved.
//

import Foundation
import AVFoundation

enum VlKeynrSound {
    case SuspenseAccent1
    case SuspenseAccent2
    case SuspenseAccent3
    case SuspenseAccent4
    case SuspenseAccent5
    case SuspenseAccent6
    case SuspenseAccent7
    case SoftMatt
    case Random

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

    private func urlForSound(sound: VlKeynrSound) -> NSURL? {
        func pathForSound(soundName: String) -> String {
            return NSBundle.mainBundle().pathForResource(soundName, ofType: "caf")!
        }

        func urlForFilename(soundName: String) -> NSURL? {
            return NSURL(fileURLWithPath: pathForSound(soundName))!
        }

        switch self {
            case .SuspenseAccent1: return urlForFilename("Suspense Accents 01")
            case .SuspenseAccent2: return urlForFilename("Suspense Accents 02")
            case .SuspenseAccent3: return urlForFilename("Suspense Accents 03")
            case .SuspenseAccent4: return urlForFilename("Suspense Accents 04")
            case .SuspenseAccent5: return urlForFilename("Suspense Accents 05")
            case .SuspenseAccent6: return urlForFilename("Suspense Accents 06")
            case .SuspenseAccent7: return urlForFilename("Suspense Accents 07")
            default: return nil
        }
    }
}