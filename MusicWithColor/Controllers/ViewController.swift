//
//  ViewController.swift
//  MusicWithColor
//
//  Created by Marcy Vernon on 5/28/20.
//  Copyright © 2020 Marcy Vernon. All rights reserved.
//
//  Wallpaper by Kevin MacLeod
//  Link: https://incompetech.filmmusic.io/song/4604-wallpaper
//  License: http://creativecommons.org/licenses/by/4.0/

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var buttonMusic: UIButton!
    
    private var audioManager: AudioPlayerManager = AudioPlayerManager()
    private let gradientLayer = CAGradientLayer()
    private weak var timer : Timer?
    
    private var previousColor = UIColor.clear
    private var hasStarted  : Bool = false
    private var random      : CGFloat { return .random(in: 0...1) }
    private var color       : CGColor { return UIColor(red: random, green: random, blue: random, alpha: 1).cgColor }
    private var point       : CGPoint { return CGPoint(x: random, y: random) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioManager.setupPlayer(soundName: "wallpaper", soundType: .mp3)
        setNotifications()
        setupGradient()
    }
    
    
    private func setNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didEnterBackground),
                                               name: .sceneDidEnterBackground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.willEnterForeground),
                                               name: .sceneWillEnterForeground, object: nil)
    }
    
    
    private func setupGradient() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    
    @IBAction func playMusic(_ sender: Any) {
        hasStarted = true
        
        if timer == nil {
            setupGradient()
            audioManager.play()
            previousColor = view.backgroundColor ?? UIColor.clear
            setupTimer()
        } else {
            timer?.invalidate()
            audioManager.pause()
            gradientLayer.removeFromSuperlayer()
            view.backgroundColor = previousColor
        }
    }
    
    private func setupTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval : 0.5,
                                         target       : self,
                                         selector     : #selector(changeGradient),
                                         userInfo     : nil, repeats : true)
        }
    }
    

    @objc func changeGradient() {
        gradientLayer.startPoint = point
        gradientLayer.endPoint   = point
        let typeArray: [ CAGradientLayerType ] = [.radial, .axial, .radial, .conic, .radial, .axial]
        let index = Int.random(in: 0...5)
        gradientLayer.type = typeArray[index]
        
        let color1 = color
        let color2 = color
        
        gradientLayer.colors = [ color1, color2, color1, color2, color1, color2, color1, color2, color1, color2,
                                 color1, color2, color1, color2, color1, color2, color1]
    }
    
    
    @objc func didEnterBackground() {
        timer?.invalidate()
    }
    
    
    @objc func willEnterForeground() {
        if hasStarted { setupTimer() }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
} // end of ViewController


