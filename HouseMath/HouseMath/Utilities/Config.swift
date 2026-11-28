//
//  Config.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-06.
//

import Foundation

enum Config {
    enum Splash {
        static let transitionDelay: Double      = 2.4
        static let fadeInDur: Double            = 0.6
        static let transitionHoldDur: Double    = 0.8
        static let fadeOutDur: Double           = 0.6
    }
    
    enum Hook {
        static let winAmount: Double            = 9.0
        static let loseAmount: Double           = -5.0
        
        static let baseSpinTime: Double         = 4.0
        static let baseSpinImageAmount: Int     = 40
        static let baseSpinVolume: Float        = 1.0
        
        static let autoSpinTimes: [Double]      = [2, 1.6, 1.2]
        static let autoSpinImageAmounts: [Int]  = [30, 25, 20]
        static let autoSpinVolumes: [Float]     = [0.7, 0.5, 0.3]
        static let autoSpinWaitTime: Double     = 0.2
        static let machineFadeDelay: Double     = 2.0
        static let machineFadeDur: Double       = 4.0
    }
}
