//
//  NoiseMachineViewController.swift
//  NoiseMachine
//
//  Created by Nathan Glynn on 6/9/18.
//  Copyright © 2018 Nathan Glynn. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class NoiseMachineViewController: UIViewController {

    
    @IBOutlet weak var playButton: UIButton!
    var noiseMachine: AVAudioPlayer?
    
    @IBOutlet weak var volumeView: MPVolumeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myVolumeView = MPVolumeView(frame: volumeView.bounds)
        volumeView.addSubview(myVolumeView)
        let path = Bundle.main.path(forResource: "noiseMachineLoop.m4a", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        let session = AVAudioSession.sharedInstance()

        do {
            noiseMachine = try AVAudioPlayer(contentsOf: url)
            noiseMachine?.stop()
            try session.setCategory(AVAudioSessionCategoryPlayback)
        } catch {
            // couldn't load file :(
        }
//        // Do any additional setup after loading the view.
    }


    @IBAction func buttonTapped(_ sender: Any) {
        if (noiseMachine?.isPlaying)! {
            noiseMachine?.stop()
            playButton.setTitle("😴", for: .normal)
        } else {
            noiseMachine?.play()
            noiseMachine?.numberOfLoops = -1
            playButton.setTitle("🤫", for: .normal)
            
        }
    }
    


}
