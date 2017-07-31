//
//  ViewController.swift
//  UIElementSwift
//
//  Created by Mayank on 27/07/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var myLabel:UILabel?
    var myButton:UIButton?
    var originalCenter:CGPoint?
    var mySwitch:UISwitch?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myLabel=UILabel(frame: CGRect(x: 0, y:0, width: 150, height: 21))
        myLabel!.center = CGPoint(x: 100, y: 600)
        myLabel!.text="DragMe"
        myLabel!.textAlignment = .center
        myLabel!.backgroundColor=UIColor.red
        self.view.addSubview(myLabel!)
        let dragLabel = UIPanGestureRecognizer(target: self, action: #selector(drag(gesture:)))
        myLabel!.addGestureRecognizer(dragLabel)
        myLabel!.isUserInteractionEnabled=true
        
        myButton=UIButton(frame: CGRect(x:0, y:0, width:77, height:62))
        myButton!.center=CGPoint(x: 200, y: 340)
        myButton!.backgroundColor=UIColor.black
        myButton!.setTitle("Press Me", for: .normal)
        myButton!.isUserInteractionEnabled=true
        self.view.addSubview(myButton!)
        var longPress = UILongPressGestureRecognizer(target: self, action: #selector(buttonPressed(gesture:)))
        myButton!.addGestureRecognizer(longPress)
        
        mySwitch=UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        mySwitch!.center = CGPoint(x: 50, y: 300)
        mySwitch?.addTarget(self, action: #selector(toggleSwitch(sender:)), for: .valueChanged)
        self.view.addSubview(mySwitch!)
    }
    
    func toggleSwitch(sender:UISwitch)
    {
        if sender.isOn
        {
            var myAlert = UIAlertController(title: "Message", message: "the switch is on now", preferredStyle: UIAlertControllerStyle.alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(myAlert, animated: true, completion: nil)
        }
        else if !sender.isOn
        {
            var myAlert = UIAlertController(title: "Message", message: "the switch is off now", preferredStyle: UIAlertControllerStyle.alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    
    func  buttonPressed(gesture:UILongPressGestureRecognizer)
    {
        if gesture.state==UIGestureRecognizerState.ended
        {
            var myAlert=UIAlertController(title: "longpressalert", message: "Button Present For Long", preferredStyle: UIAlertControllerStyle.alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(myAlert,animated:true,completion:nil)
        }
    }
    
   
    
    func drag(gesture:UIPanGestureRecognizer)
    {
        
        var label = gesture.view! as! UILabel
        var translation = gesture.translation(in: self.view)
        switch (gesture.state)
        {
        case UIGestureRecognizerState.began:
            originalCenter=label.center
        case UIGestureRecognizerState.changed:
            label.center = CGPoint(x:(label.center.x + translation.x),
                                   y:(label.center.y + translation.y))
            
        case UIGestureRecognizerState.ended:
            label.center=originalCenter!
        default:
            break
        }
        gesture.setTranslation(CGPoint(x:0,y:0), in: self.view) // reset the translation that now, is already applied to the label
    }
}

