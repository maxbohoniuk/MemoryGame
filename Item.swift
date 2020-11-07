//
//  Item.swift
//  MemoryGame
//
//  Created by Max Bohoniuk on 15.12.2019.
//  Copyright © 2019 PJATK. All rights reserved.
//

import Foundation
import UIKit

class Item{
    
    
    
    var file:String = ""
    var imageViewFront, imageViewBack:UIImageView?
    var flipped:Bool = false
    var index:Int = 0
    var button: UIButton?
    
    
    
    init(file:String,index:Int){
        self.file = file
        self.index = index
        
        
    }
    
    
    
    func flip(){
        imageViewBack?.alpha = 1 //przezroczystosc Logo true
        
        UIView.transition(from: imageViewFront!, to: imageViewBack!, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews,], completion: nil)
        button!.setImage(nil, for: .normal)
        flipped = true
        
    
    
    }
    
    func backFlip(){
        imageViewBack?.alpha = 0
        button!.setImage(UIImage(named: "rsz_car.png"), for: .normal)
        UIView.transition(from: imageViewFront!, to: imageViewBack!, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        flipped = false
        
    }
    
}
