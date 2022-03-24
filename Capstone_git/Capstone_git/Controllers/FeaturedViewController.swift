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
    
    @IBOutlet weak var topSlider: UICollectionView!
    
    var imgArr = [UIImage(named: "bakery"),UIImage(named: "cake-slice"),UIImage(named: "chicken-leg"),UIImage(named: "hamburger"),UIImage(named: "hot-soup"),UIImage(named: "momo"),UIImage(named: "pizza"),UIImage(named: "salad"),UIImage(named: "sandwhich")]
    var nameArr = ["Bakery","Dessert","Chicken","Burger", "Soup","Momo", "Pizza","Salad", "Sandwhich"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        var Count = 0
        if(collectionView == featuredCollectionView){
        return featuredImages.count
        }
        else{
            return imgArr.count
        }
        return Count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == featuredCollectionView){
             let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "singleCell", for: indexPath)
            as! FeaturedCollectionViewCell
            
            cell.FeaturedImage.image=UIImage(named: featuredImages[indexPath.row])
            
            return cell
        }
        else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopSliderCollection
            cell.foodIcons.image  = imgArr[indexPath.row]
            cell.lblDisplay.text = nameArr[indexPath.row]
            return cell
        }
        
       return UICollectionViewCell()
        
    } 

    
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        topSlider.delegate = self
        topSlider.dataSource = self
               
    
        
        // Do any additional setup after loading the view.
    }

}


class TopSliderCollection : UICollectionViewCell {
   
    @IBOutlet weak var lblDisplay: UILabel!
    @IBOutlet weak var foodIcons: UIImageView!
    // @IBOutlet weak var myWebSeries: UIImageView!
}
