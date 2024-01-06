//
//  ViewController.swift
//  Xylophone
//
//  Created by Zach Mwaura on 1/5/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.titleLabel?.text ?? "C")
        
        sender.alpha = 0.5
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension:"wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
}

//func playSound() {
//    guard let path = Bundle.main.path(forResource: "beep", ofType:"mp3") else {
//        return }
//    let url = URL(fileURLWithPath: path)
//
//    do {
//        player = try AVAudioPlayer(contentsOf: url)
//        player?.play()
//        
//    } catch let error {
//        print(error.localizedDescription)
//    }
//}

