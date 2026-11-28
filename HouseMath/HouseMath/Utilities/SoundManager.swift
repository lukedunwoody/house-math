//
//  SoundManager.swift
//  HouseMath
//
//  Created by Luke Dunwoody on 2026-11-27.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var players: [AVAudioPlayer] = []
    
    private init() {}
    
    func play(
        _ soundName: String,
        extension ext: String,
        volume: Float = 1.0,
        duration: TimeInterval? = nil,
        looping: Bool = false,
        fadeIn: TimeInterval = 0
    ) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: ext) else {
            return
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            let targetVolume = max(0.0, min(1.0, volume))
            
            player.numberOfLoops = looping ? -1 : 0
            
            if fadeIn > 0 {
                player.volume = 0
                player.play()
                player.setVolume(targetVolume, fadeDuration: fadeIn)
            } else {
                player.volume = targetVolume
                player.play()
            }
            
            players.append(player)

            
            if let duration = duration {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self, weak player] in
                    guard let player = player else { return }
                    player.stop()
                    self?.players.removeAll { $0 === player }
                }
            }
            
            players.removeAll { !$0.isPlaying && $0 !== player }
        } catch {
            return
        }
    }
}
