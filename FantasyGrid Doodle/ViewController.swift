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
                cells[key] = cellView
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
        // Reset butonunu oluştur ve view'a ekle
        let resetButton = UIButton(type: .system)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(resetGrid), for: .touchUpInside)
        resetButton.frame = CGRect(x: 150, y: view.frame.height - 100, width: 100, height: 100) // İsteğe bağlı: butonun konumunu ve boyutunu ayarla
        resetButton.backgroundColor = UIColor.gray
        resetButton.setTitleColor(UIColor(white: 1, alpha: 0.7), for: .normal)
        resetButton.layer.borderWidth = 2.0 // Örnek olarak 2 piksel kalınlığında bir kenarlık
        resetButton.layer.borderColor = UIColor.black.cgColor // Kenarlığın rengi
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0) // Kalın bir yazı tipi ve 16 punto boyutu örneği
        resetButton.layer.shadowColor = UIColor.black.cgColor
        resetButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        resetButton.layer.shadowRadius = 4.0
        resetButton.layer.shadowOpacity = 0.5
        resetButton.alpha = 0.9 // 0.5 değeri yarı opaklık (yarı saydamlık) sağlar
        resetButton.layer.cornerRadius = 10.0 // Kenar yuvarlaklığının boyutunu ayarlayın (örneğin, 10 piksel)
        resetButton.layer.masksToBounds = true // Kenar yuvarlaklığını etkinleştirin

        view.addSubview(resetButton)
    }
    
    @objc func handlePan(gesture: UIGestureRecognizer) {
        let location = gesture.location(in: view)
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        let key = "\(i)|\(j)"
        let cellView = cells[key]
        
        cellView?.backgroundColor = .white
    }
    
    @objc func resetGrid() {
        for cellView in cells.values {
            cellView.backgroundColor = randomColor()
        }
    }
    
    fileprivate func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
