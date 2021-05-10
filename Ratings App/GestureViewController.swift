//
//  GestureViewController.swift
//  Ratings App
//
//  Created by MacBook on 07/05/21.
//

import UIKit

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: view)
        
        guard let gestureView = gesture.view else{
            return
        }
        
        gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else {
            return
        }
        
        let velocity = gesture.velocity(in: view)
        let magnitude = sqrt((velocity.x * velocity.x) +  (velocity.y * velocity.y))
        let slideMultipler = magnitude / 200
        
        let sliderFactor = 0.1 * slideMultipler
        
        var finalPoint = CGPoint(
            x: gestureView.center.x + (velocity.x * velocity.x),
            y: gestureView.center.y + (velocity.y * velocity.y)
            )
        
        finalPoint.x = min(max(finalPoint.x, 0), view.frame.width)
        finalPoint.y = min(max(finalPoint.y, 0), view.frame.height)
        
        UIView.animate(
            withDuration: Double(sliderFactor * 2),
            delay: 0,
            options: .curveEaseOut,
            animations: {gestureView.center = finalPoint}
        )
        
    }
    

    
    
   


}
