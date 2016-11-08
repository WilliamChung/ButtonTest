//
//  ViewController.swift
//  ButtonTest
//
//  Created by William Chung on 2016-10-24.
//  Copyright © 2016 William Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeStamp: UITextField!
    @IBOutlet weak var downDownTime: UITextField!
    @IBOutlet weak var downUpTime: UITextField!
    @IBOutlet weak var shiftButton: UIButton!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var pressure: UITextField!
    @IBOutlet weak var areaPressed: UITextField!
    
    var tStamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    
    var oldDownTime: Double = 0
    var currentDownTime: Double = 0
    var upTime: Double = 0
    var downTimeDifference: Double = 0
    var upTimeDifference: Double = 0
    var shiftClicked: Bool = false
    var location: CGPoint?
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        if let touch = touches.first {
            let position: CGPoint = touch.location(in: view)
            print(position.x)
            print(position.y)
            
            let locX: CGFloat = position.x
            let locY: CGFloat = position.y
                
            let x = String (stringInterpolationSegment:locX)
            let y = String (stringInterpolationSegment:locY)
                
            areaPressed.text = "X: " + x + ", Y: " + y
            
            for touch in touches{
                let touchForce: CGFloat = touch.force
                let maxForce: CGFloat = touch.maximumPossibleForce
                let touchPercentage: CGFloat = touchForce/maxForce
                
                let tP = String (stringInterpolationSegment:touchPercentage)
                
                print("% Touch pressure: \(touchForce/maxForce)");
                pressure.text = tP + "%"
            }
        }
        
        super.touchesBegan(touches , with: event)
    }
    /*
    class customButton : UIButton{
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches{
                print("% Touch pressure: \(touch.force/touch.maximumPossibleForce)");
            }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            print("Touches End")
        }
    }
 */
    
    @IBAction func push(_ sender: UIButton) {
        
        oldDownTime = currentDownTime
        currentDownTime = Double (tStamp)!
        
        downTimeDifference = currentDownTime - oldDownTime
        
        downDownTime.text = String (downTimeDifference)
        timeStamp.text = String (tStamp)
        
    }
    
    
    //func preciseLocation(in view: UIView?) -> CGPoint
    //{}
    
    
    @IBAction func release(_ sender: UIButton) {
        
        upTime = Double (tStamp)!
        upTimeDifference = upTime - currentDownTime
        
        downUpTime.text = String (upTimeDifference)
    }
    
    
    @IBAction func shiftClick(_ sender: UIButton) {
        
        if(shiftClicked == false){
            clickButton.setTitle("CLICK", for: .normal)
            shiftClicked = true
        }
        else {
            clickButton.setTitle("Click", for: .normal)
            shiftClicked = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

