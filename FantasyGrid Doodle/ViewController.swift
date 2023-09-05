//
//  ViewController.swift
//  FantasyGrid Doodle
//
//  Created by Emin Kavak on 06/09/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        let numViewPerRow = 15
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        
        for j in 0 ... 40 {
            for i in 0 ... numViewPerRow {
                let cellView = UIView()
                cellView.backgroundColor = randomColor()
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(cellView)
                
            }
        }
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    
    }
    
    @objc func handlePan (gesture:UIGestureRecognizer){
        let location = gesture.location(in: view)
        
        
        for subView in view.subviews{
            
            if subView.frame.contains(location){
                subView.backgroundColor = .black
                
            }
                
                
        }
     
    }
    
    fileprivate func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }


}

