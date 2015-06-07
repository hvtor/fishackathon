//
//  SecondViewController.swift
//  fishYouWereHereFinal
//
//  Created by Gavin Thompson on 2015-06-05.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let reuseIdentifier = "Cell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var fishCollection = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadPListData()


    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fishCollection.count
    }

    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        let fishPlistData = self.fishCollection[indexPath.row] 
        
        println("fishPlistData \(fishPlistData)")
//        println( fishPlistData["Image"] )
        
        cell.imageView.image = UIImage(named: fishPlistData["ImageName"]! )
        
        cell.commonNameLabel.text = fishPlistData["CommonName"]
        return cell
    }
    
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPListData(){
        
        var plistArray:NSArray?
        
        if let path = NSBundle.mainBundle().pathForResource("fishackathon2015", ofType: "plist") {
            plistArray = NSArray(contentsOfFile: path)!
        }
        
//        println( plistArray )
        
        if let array = plistArray {
            
            for fish in array{
                let fishData = fish as? NSDictionary
                self.fishCollection.append( fishData! as! Dictionary<String, String> )
//                println( fishData )
            }
        }
        
        
    }
    
//    func loadPListDataold(){
//        
//        // MARK: == fishackathon2015.plist Keys ==
//        let SpeciesNameKey = "SpeciesName"
//        let CommonNameKey = "CommonName"
//        let ImageURLKey = "ImageURL"
//        
//        var speciesName: AnyObject
//        var commonName: AnyObject
//        var imageURL: AnyObject
//        
//        // getting path to fishackathon2015.plist
//        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
//        let documentsDirectory = paths[0] as! String
//        let path = documentsDirectory.stringByAppendingPathComponent("fishYouWereHereFinal/fishackathon2015.plist")
//        let fileManager = NSFileManager.defaultManager()
//        //check if file exists
//        if(!fileManager.fileExistsAtPath(path)) {
//            // If it doesn't, copy it from the default file in the Bundle
//            if let bundlePath = NSBundle.mainBundle().pathForResource("fishackathon2015", ofType: "plist") {
//                var resultArray = NSArray(contentsOfFile: bundlePath)
//                //                var speciesName = resultArray.["SpeciesName"]
//                //                    resultArray.["CommonName"]
//                //                resultArray.["ImageURL"]
//                println("Bundle fishackathon2015.plist file is --> \(resultArray?.description)")
//                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
//                println("copy")
//            } else {
//                println("fishackathon2015.plist not found. Please, make sure it is part of the bundle.")
//            }
//        } else {
//            println("fishackathon2015.plist already exits at path.")
//            // use this to delete file from documents directory
//            //fileManager.removeItemAtPath(path, error: nil)
//        }
//        let resultArray = NSMutableArray(contentsOfFile: path)
//        println("Loaded fishackathon2015.plist file is --> \(resultArray)")
//        var myDict: = resultArray?[0]
//        if let dict = myDict {
//            //loading values
//            speciesName = dict.objectForKey(SpeciesNameKey)!
//            commonName = dict.objectForKey(CommonNameKey)!
//            imageURL = dict.objectForKey(ImageURLKey)!
//        } else {
//            println("WARNING: Couldn't create dictionary from fishackathon2015.plist! Default values will be used!")
//        }
//        
//    }

}




