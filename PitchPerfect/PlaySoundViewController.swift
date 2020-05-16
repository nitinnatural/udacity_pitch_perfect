//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Nitin Anand on 08/05/20.
//  Copyright © 2020 tintin. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var chimpunkButton: UIButton!
    @IBOutlet weak var darthButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL : URL!
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)    }

    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setAspectRatioForButton()
        configureUI(.notPlaying)
    }
    
    func setAspectRatioForButton(){
        slowButton.contentMode = .center
        slowButton.imageView?.contentMode = .scaleAspectFit
        
        fastButton.contentMode = .center
        fastButton.imageView?.contentMode = .scaleAspectFit
        
        chimpunkButton.contentMode = .center
        chimpunkButton.imageView?.contentMode = .scaleAspectFit
        
        darthButton.contentMode = .center
        darthButton.imageView?.contentMode = .scaleAspectFit
        
        echoButton.contentMode = .center
        echoButton.imageView?.contentMode = .scaleAspectFit
        
        robotButton.contentMode = .center
        robotButton.imageView?.contentMode = .scaleAspectFit
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
