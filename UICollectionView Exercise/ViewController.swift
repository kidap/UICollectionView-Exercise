//
//  ViewController.swift
//  UICollectionView Exercise
//
//  Created by Karlo Pagtakhan on 01/25/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var imageView: UIImageView!
    
    var image = UIImage()
    var textLable = " "
    @IBOutlet var label: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    let starWarsCollection = ["rey","fin","kyloren","leia","hansolo","luke","poe"]

    var imageArray = [UIImage()]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView.image = image
        label.text = textLable
        
        collectionView.delegate = self
        
        imageArray.removeFirst()
        for starWarsCharacter in starWarsCollection{
            imageArray.append(UIImage(named: String(starWarsCharacter))!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return starWarsCollection.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! KPCollectionViewCell
        
        // Configure the cell
        cell.label.text = starWarsCollection[indexPath.row]
        cell.imageView.image = imageArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        label.text = starWarsCollection[indexPath.row]
        self.imageView.image = imageArray[indexPath.row]
        
    }
}

