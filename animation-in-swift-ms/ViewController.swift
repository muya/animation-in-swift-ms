//
//  ViewController.swift
//  animation-in-swift-ms
//
//  Created by Muya on 8/6/14.
//  Copyright (c) 2014 muya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
//    @IBOutlet weak var numberOfFishSliderLabel: UILabel!
    
    @IBOutlet weak var numberOfFishSliderLabel: UILabel!
    @IBOutlet weak var numberOfFishSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }
    
    @IBAction func numberOfFishSliderChanged(sender: AnyObject) {
        refreshUI()
    }
    func refreshUI(){
        let numberOfFishSliderValue = Int(self.numberOfFishSlider.value)
        numberOfFishSliderLabel.text = "\(numberOfFishSliderValue) Fish"
    }
    
    @IBAction func animateButtonPressed(sender: AnyObject) {
        let numberOfFish = Int(self.numberOfFishSlider.value)
        for loopNumber in 0...numberOfFish{
            //let size be a random number between 20 and 60
            let size : CGFloat = CGFloat(Int(rand()) % 40 + 20.0)
            
            // set yPostion to be a random number between 20 and 220
            let yPosition : CGFloat = CGFloat(Int(rand()) % 200 + 20.0)
            
            // create the fish and add it to the screen
            let fish = UIImageView()
            fish.image = UIImage(named: "fish_toothy_blue.png")
            fish.frame = CGRect(x: (0 - size), y: yPosition, width: size, height: size)
            self.view.addSubview(fish)
            
            //create and add a new square
//            let coloredSquare = UIView()
//            
//            //set background color to blue
//            coloredSquare.backgroundColor = UIColor.blueColor()
//            
//            //set frame (position and size) of the square
//            //iOS coordinate system starts at the top left of the screen
//            //so this square will be a thte top let of the screen, 50x50pt
//            //CG in CGRect stands for Core Graphics
//            coloredSquare.frame = CGRect(x: 0, y: yPosition, width: size, height: size)
//            
//            //add square to the screen
//            self.view.addSubview(coloredSquare)
            
            let duration = 1.0
            
            // delay be random value between .9 and 1.0
            let delay = NSTimeInterval(((Int(rand())) % 900) + 100.0) / 1000.0
            
            let options = UIViewAnimationOptions.CurveLinear
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
//                coloredSquare.backgroundColor = UIColor.redColor()
                
                /*
                for the x-position I entered 320-50 (width of the screen - width of
                the square
                better to put the math to remember what's happening
                */
                fish.frame = CGRect(x: (self.getScreenWidth()), y: yPosition, width: size, height: size)
                }, completion: { finished in
                    fish.removeFromSuperview()
            })
        }

    }
    func getScreenWidth() -> CGFloat{
        return UIScreen.mainScreen().bounds.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

