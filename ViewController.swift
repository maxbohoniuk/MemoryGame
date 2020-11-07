//
//  ViewController.swift
//  MemoryGame
//
//  Created by Max Bohoniuk on 15.12.2019.
//  Copyright © 2019 PJATK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    
    @IBOutlet var buttons:[UIButton] = []
    
    @IBOutlet var images:[UIImageView] = []
    
    @IBOutlet weak var showBtn: UIButton!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var LevelSlider: UISlider!
    @IBOutlet weak var points: UILabel!
    
    var ses:Session?
    
    
    
    @IBAction func Start(_ sender: Any) {
        ses = Session()
        
        for e in buttons{
            e.isEnabled = true
        }
        showBtn.isEnabled = true
        
        for e in ses!.items{
            images[e.index].image = UIImage(named: e.file)
            print("setting to \(e.index): \(e.file)")
            
            e.imageViewBack = images[e.index]
            e.imageViewFront = buttons[e.index].imageView
            
            e.button = buttons[e.index]
            
            
            
            
            images[e.index].alpha = 0
            
            
        }
        
        for e in ses!.items{
            e.flip()
            e.backFlip()
            
        }
        
        
        
    }
    
    @IBAction func Show(_ sender: Any) {
        if ses!.openedItem != nil{
            ses!.openedItem?.backFlip()
            ses?.openedItem = nil
        }
        ses!.pointsInt -= 2
        points.text  = "\(ses!.pointsInt)"
        if(ses!.getRemainingItemsCount() != 0 ){
            let it = ses!.getItemForShow()
            it.flip()
            Timer.scheduledTimer(withTimeInterval: TimeInterval(LevelSlider!.value), repeats: false, block: {_ in
                it.backFlip()
                
            })
        }
        
        
        
    }
    
    @IBAction func btnPressed(_ sender: UIButton){
        var BtnIndex = 0
        BtnIndex = buttons.firstIndex(of: sender)!
        print("\(BtnIndex) pressed!   item index = \(ses!.items[BtnIndex].index)")
        for e in ses!.items{
            if e.index == BtnIndex{
                if !e.flipped{
                    e.flip()
                    
                    
                    let res = ses?.flippingTest(it: e)
                    points.text = "\(String(describing: res!))"
                    
                    if ses?.getRemainingItemsCount() == 0{
                        //alert
                    }
                    
                    
                    
                    
                    
                    
                }else{
                    e.backFlip()
                    
                    
                    
                }
                
                
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    func delayFlip(seconds: UInt32, item: Item){
        sleep(seconds)
        //Timer.scheduledTimer(withTimeInterval: seconds, repeats: false, block: {_ in })
        item.backFlip()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for e in buttons{
            e.isEnabled = false
        }
        showBtn.isEnabled = false
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

