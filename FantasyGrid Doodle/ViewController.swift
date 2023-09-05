//
//  ViewController.swift
//  FantasyGrid Doodle
//
//  Created by Emin Kavak on 06/09/2023.
//

import UIKit

class ViewController: UIViewController {
    let numViewPerRow = 15
    var cells = [String:UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        
        for j in 0 ... 40 {
            for i in 0 ... numViewPerRow {
                let cellView = UIView()
                cellView.backgroundColor = randomColor()
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(cellView)
                let key = "\(i)|\(j)"
                cells [key] = cellView
                
            }
        }
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self,
                                                         action: #selector(handlePan)))
        }
        
    @objc func handlePan (gesture:UIGestureRecognizer){
            let location = gesture.location(in: view)
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        let key = "\(i)|\(j)"
        let cellView = cells[key]
        
        cellView?.backgroundColor = .white
        
           /* var loopCount = 0
            for subView in view.subviews{
                if subView.frame.contains(location){
                    subView.backgroundColor = .black
                    
                }
                loopCount += 1 */
                
            }
            
        }
        
    }
    fileprivate func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    

