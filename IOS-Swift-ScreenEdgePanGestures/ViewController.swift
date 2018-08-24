//
//  ViewController.swift
//  IOS-Swift-ScreenEdgePanGestures
//
//  Created by Pooya on 2018-08-23.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    var currentRadius:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Screen Edge Pan Gestures
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(rotateBall(_:)))   // Selector(("rotateBall:")))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
    }

    @objc func rotateBall(_ sender: UIScreenEdgePanGestureRecognizer) {
        // 1 if the gesture is ended the code inside the if-block is executed
        if sender.state == .ended {
            // 2 if the ball has rotated a whole circle the radius is reset to 0.
            if self.currentRadius==360.0 {
                self.currentRadius=0.0
            }
            // 3 An animation is performed where the ball rotates 90 degrees in 1 second.
            UIView.animate(withDuration: 1.0, animations: {
                self.currentRadius += 90.0
                self.imageView.transform = CGAffineTransform(rotationAngle: (self.currentRadius * CGFloat(Double.pi)) / 180.0)
            })
        }
      }

}
