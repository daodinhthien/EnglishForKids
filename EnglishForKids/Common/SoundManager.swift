//
//  SoundManager.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 18/6/26.
//

import AudioToolbox
import UIKit

class SoundManager {
    static let shared = SoundManager()
    private init() {}

    func playCorrect() {
        AudioServicesPlaySystemSound(1057)
        let gen = UIImpactFeedbackGenerator(style: .medium)
        gen.impactOccurred()
    }

    func playWrong() {
        AudioServicesPlaySystemSound(1053)
        let gen = UINotificationFeedbackGenerator()
        gen.notificationOccurred(.error)
    }

    func playComplete() {
        AudioServicesPlaySystemSound(1025)
        let gen = UINotificationFeedbackGenerator()
        gen.notificationOccurred(.success)
    }
}
