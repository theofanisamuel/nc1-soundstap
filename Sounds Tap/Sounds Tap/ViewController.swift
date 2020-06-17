//
//  ViewController.swift
//  Sounds Tap
//
//  Created by Theofani on 05/03/20.
//  Copyright © 2020 Theofani. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet var BgView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var bmwButton: UIButton!
    @IBOutlet weak var lamboButton: UIButton!
    @IBOutlet weak var supraButton: UIButton!
    
    @IBOutlet weak var imageLabel1: UILabel!
    @IBOutlet weak var imageLabel2: UILabel!
    @IBOutlet weak var imageLabel3: UILabel!
    
    @IBOutlet weak var playButton1: UIImageView!
    @IBOutlet weak var playButton2: UIImageView!
    @IBOutlet weak var playButton3: UIImageView!
    
    @IBOutlet weak var stopButton1: UIButton!
    @IBOutlet weak var stopButton2: UIButton!
    @IBOutlet weak var stopButton3: UIButton!
    
    @IBOutlet weak var bgHighlight1: UIView!
    @IBOutlet weak var bgHighlight2: UIView!
    @IBOutlet weak var bgHighlight3: UIView!
    
    
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var labelResetClick: UILabel!
    
    var musicEffect1: AVAudioPlayer = AVAudioPlayer()
    var musicEffect2: AVAudioPlayer = AVAudioPlayer()
    var musicEffect3: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImageView.image = #imageLiteral(resourceName: "defaultBg")
        
//        bmwButton.layer.shadowColor = UIColor.white.cgColor
//        bmwButton.layer.shadowOffset = CGSize(width: 5, height: 5)
//        bmwButton.layer.shadowRadius = 20
//        bmwButton.layer.shadowOpacity = 1
        
//        bgHighlight1.isHidden = true
//        bgHighlight2.isHidden = true
//        bgHighlight3.isHidden = true

        bmwButton.layer.cornerRadius = 20.0
        lamboButton.layer.cornerRadius = 20.0
        supraButton.layer.cornerRadius = 20.0
        
        bmwButton.titleLabel?.alpha = 0
        lamboButton.titleLabel?.alpha = 0
        supraButton.titleLabel?.alpha = 0
    
        // Do any additional setup after loading the view.
        
        //BMW car sound
        let soundBmw = Bundle.main.path(forResource: "bmw-sound", ofType: ".mp3")
        
        do {
            try musicEffect1 = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundBmw!))
        }
        catch {
            print (error)
        }
        
        //Lamborghini car sound
        let soundLambo = Bundle.main.path(forResource: "lambo-sound", ofType: ".mp3")
        
        do {
            try musicEffect2 = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundLambo!))
        }
        catch {
            print (error)
        }
        
        //Supra car sound
        let soundSupra = Bundle.main.path(forResource: "supra-gr-sound", ofType: ".mp3")
        
        do {
            try musicEffect3 = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundSupra!))
        }
        catch {
            print (error)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopButton1.isHidden = true
        stopButton2.isHidden = true
        stopButton3.isHidden = true
    }
    
    let highlightedColor = UIColor.white
    let notHighlightedColor = UIColor.secondaryLabel
    
        
//    @IBAction func playSoundBmw(_ sender: Any) {
//        musicEffect1.play()
//        stopButton1.isHidden = false
//        stopButton2.isHidden = true
//        stopButton3.isHidden = true
//        musicEffect2.stop()
//        musicEffect3.stop()
//        imageLabel1.textColor = highlightedColor
//        imageLabel2.textColor = notHighlightedColor
//        imageLabel3.textColor = notHighlightedColor
//    }
//    
//    @IBAction func playSoundLambo(_ sender: Any) {
//        musicEffect2.play()
//        stopButton2.isHidden = false
//        stopButton1.isHidden = true
//        stopButton3.isHidden = true
//        musicEffect1.stop()
//        musicEffect3.stop()
//        imageLabel2.textColor = highlightedColor
//        imageLabel1.textColor = notHighlightedColor
//        imageLabel3.textColor = notHighlightedColor
//    }
//    @IBAction func playSoundSupra(_ sender: Any) {
//        musicEffect3.play()
//        stopButton3.isHidden = false
//        stopButton1.isHidden = true
//        stopButton2.isHidden = true
//        musicEffect1.stop()
//        musicEffect2.stop()
//        imageLabel3.textColor = highlightedColor
//        imageLabel1.textColor = notHighlightedColor
//        imageLabel2.textColor = notHighlightedColor
//    }
   
    
    @IBAction func playingSounds(_ sender: UIButton) {
        
        switch sender {
        case bmwButton:
            reset()
            bgImageView.image = #imageLiteral(resourceName: "bgView-bmw")
            musicEffect1.play()
            bmwButton.alpha = 1
            lamboButton.alpha = 0.5
            supraButton.alpha = 0.5
            bmwButton.titleLabel?.alpha = 1
            lamboButton.titleLabel?.alpha = 0
            supraButton.titleLabel?.alpha = 0
            playButton1.isHidden = true
            stopButton1.isHidden = false
            stopButton2.isHidden = true
            stopButton3.isHidden = true
            musicEffect2.stop()
            musicEffect3.stop()
            imageLabel1.textColor = highlightedColor
            imageLabel2.textColor = notHighlightedColor
            imageLabel3.textColor = notHighlightedColor
        case lamboButton:
            reset()
            bgImageView.image = #imageLiteral(resourceName: "bgView-lambo")
            musicEffect2.play()
            bmwButton.alpha = 0.5
            lamboButton.alpha = 1
            supraButton.alpha = 0.5
            bmwButton.titleLabel?.alpha = 0
            lamboButton.titleLabel?.alpha = 1
            supraButton.titleLabel?.alpha = 0
            playButton2.isHidden = true
            stopButton2.isHidden = false
            stopButton1.isHidden = true
            stopButton3.isHidden = true
            musicEffect1.stop()
            musicEffect3.stop()
            imageLabel2.textColor = highlightedColor
            imageLabel1.textColor = notHighlightedColor
            imageLabel3.textColor = notHighlightedColor
        case supraButton:
            reset()
            bgImageView.image = #imageLiteral(resourceName: "bgView-supra")
            musicEffect3.play()
            bmwButton.alpha = 0.5
            lamboButton.alpha = 0.5
            supraButton.alpha = 1
            bmwButton.titleLabel?.alpha = 0
            lamboButton.titleLabel?.alpha = 0
            supraButton.titleLabel?.alpha = 1
            playButton3.isHidden = true
            stopButton3.isHidden = false
            stopButton1.isHidden = true
            stopButton2.isHidden = true
            musicEffect1.stop()
            musicEffect2.stop()
            imageLabel3.textColor = highlightedColor
            imageLabel1.textColor = notHighlightedColor
            imageLabel2.textColor = notHighlightedColor
        default:
            print("")
        }
    }
    
    
    func stopSound(){
        musicEffect1.stop()
        musicEffect2.stop()
        musicEffect3.stop()
        bmwButton.titleLabel?.alpha = 0
        lamboButton.titleLabel?.alpha = 0
        supraButton.titleLabel?.alpha = 0
        imageLabel1.textColor = notHighlightedColor
        imageLabel2.textColor = notHighlightedColor
        imageLabel3.textColor = notHighlightedColor

    }
    
    func reset(){
        bgImageView.image = #imageLiteral(resourceName: "defaultBg")
        bmwButton.alpha = 1
        lamboButton.alpha = 1
        supraButton.alpha = 1
        stopButton1.isHidden = true
        stopButton2.isHidden = true
        stopButton3.isHidden = true
        playButton1.isHidden = false
        playButton2.isHidden = false
        playButton3.isHidden = false
    }
    
    @IBAction func stopPlayingSounds(_ sender: UIButton) {
        stopSound()
        reset()
    }
    
}

