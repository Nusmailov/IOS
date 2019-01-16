//
//  RandomViewController.swift
//  I Am Rich
//
//  Created by Nurzhigit Smailov on 1/16/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import UIKit


class RandomViewController: UIViewController {
    
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    struct Point{
        var x: Int?
        var y: Int?
    }
    public var listStory = [Point]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    
    
    @IBAction func rollButton(_ sender: UIButton) {
        updateImages();
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateImages();
    }
    
    func randomNumber() -> Int {
        return Int.random(in: 0...5)
    }
    
    func updateImages(){
        let x:Int = randomNumber()
        let y:Int = randomNumber()
        diceImage1.image = UIImage(named: diceArray[x])
        diceImage2.image = UIImage(named: diceArray[y])
        var a = Point()
        a.x = x;
        a.y = y;
        listStory.append(a)
    }
    
    
    @IBAction func updateTableView(_ sender: UIButton) {
        
    }
    
}
