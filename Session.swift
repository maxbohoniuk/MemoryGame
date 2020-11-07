//
//  Session.swift
//  MemoryGame
//
//  Created by Max Bohoniuk on 15.12.2019.
//  Copyright © 2019 PJATK. All rights reserved.
//

import Foundation
import UIKit

class Session{
    
    
    
    
    init() {
        
        //Items creating
        for _ in 1...4{
            items.append(getRandomItem())
        }
        
        
        print("items = \(items.count)")
       
    }
    
    
    
    var files = ["audi.png","bmw.png","ferrari.png","lamba.png","mercedes.png","nissan.png","rolls.png","toyota.png","volkswagen.png","volvo.png"]
    
     var items:[Item] = []
    var Indexes:[Int] = [0,1,2,3,4,5,6,7]
    
    
    var pointsInt = 0
    
    var openedItem:Item?
    
    
    
    func getRandomItem()->Item{
        let rFile = Int.random(in: 0...files.count-1)
        var rIndex1:Int,rIndex2:Int
        
        let str = files[rFile]
        files.remove(at: rFile)
        
        print("size = \(Indexes.count-1)")
        
        
        rIndex1 = Int.random(in: 0...Indexes.count-1)
        rIndex1 = Indexes[rIndex1]
        Indexes.remove(at: Indexes.firstIndex(of: rIndex1)!)
        
        
        rIndex2 = Int.random(in: 0...Indexes.count-1)
        rIndex2 = Indexes[rIndex2]
        Indexes.remove(at: Indexes.firstIndex(of: rIndex2)!)
        
        items.append(Item(file: str, index: rIndex2))
        
        
        
        
        
        return Item(file: str, index: rIndex1   )
    }
    
    
    func flippingTest(it: Item) -> Int{
        if(openedItem == nil){
            openedItem = it
        }
        else{
            if(it.file == openedItem!.file){
                pointsInt += 1
                openedItem?.button?.isEnabled = false
                it.button?.isEnabled = false
                openedItem = nil
            }
            else{
                
                /*Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {_ in
                    it.backFlip()
                    
                    })*/ //with delay!
                it.backFlip()
                
                openedItem?.backFlip()
                
                
                openedItem = nil
            }
        }
        return pointsInt
    }
    
    func getItemForShow()->Item{
        var r = Int.random(in: 0..<items.count)
        while(items[r].flipped){
            r = Int.random(in: 0..<items.count)
        }
        return items[r]
        
    }
    
    func getRemainingItemsCount()->Int{
        var res = 0
        for e in items where e.flipped == false{
            res += 1
        }
        return res
    }
    
   
    
    
    
    
    
    
}

