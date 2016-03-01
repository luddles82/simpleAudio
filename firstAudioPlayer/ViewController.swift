//
//  ViewController.swift
//  firstAudioPlayer
//
//  Created by Nick Ludlow on 01/03/2016.
//  Copyright © 2016 Nick Ludlow. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var PausePlay: UIButton!
    
    //var ButtonAudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Opener", ofType: "aiff")!)
    
    var Opener:AVAudioPlayer = AVAudioPlayer()
    
    var Main:AVAudioPlayer = AVAudioPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ButtonAudioPlayer = AVAudioPlayer(contentsOfURL: ButtonAudioURL)
        
        let ButtonAudioURL:NSURL = NSBundle.mainBundle().URLForResource("Opener", withExtension: "aiff")!
        do { Opener = try AVAudioPlayer(contentsOfURL: ButtonAudioURL, fileTypeHint: nil) } catch _ { }
        Opener.prepareToPlay()
        
        let BackgroundAudioURL:NSURL = NSBundle.mainBundle().URLForResource("Main", withExtension: "aiff")!
        do { Main = try AVAudioPlayer(contentsOfURL: ButtonAudioURL, fileTypeHint: nil) } catch _ { }
        Main.prepareToPlay()
        
        //Main.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PlayAudio1(sender: AnyObject) {
        Opener.play()
    }
    
    @IBAction func Stop(sender: AnyObject) {
        Main.stop()
        Main.currentTime = 0
        PausePlay.setTitle("Play", forState: UIControlState.Normal)
    
    }
    
    @IBAction func Restart(sender: AnyObject) {
        Main.stop()
        Main.currentTime = 0
        Main.play()
    }
    
    @IBAction func PausePlay(sender: AnyObject) {
        
        if (Main.playing == true){
            Main.stop()
            PausePlay.setTitle("Play", forState: UIControlState.Normal)
        
        } else {
            
            Main.play()
            PausePlay.setTitle("Pause", forState: UIControlState.Normal)
        
        }
        
    }
    
    
    

}

