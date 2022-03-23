//
//  FeaturedViewController.swift
//  Capstone_git
//
//  Created by user202461 on 3/23/22.
//

import UIKit

class FeaturedViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var featuredImages:[String]=["01","02","03","04","05"]
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "singleCell", for: indexPath)
        as! FeaturedCollectionViewCell
        
        cell.FeaturedImage.image=UIImage(named: featuredImages[indexPath.row])
        
        return cell
        
    }
    

    
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
               
    
        
        // Do any additional setup after loading the view.
    }

}
