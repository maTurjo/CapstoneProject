//
//  FeaturedViewController.swift
//  Capstone_git//
//  Code Created by Sohilmahammad Liyakatali Polara

import UIKit


class FeaturedViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartItem.cartItemName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",for:indexPath) as! AllRestaurentTableCell
        cell.lblDishName?.text =  cartItem.cartItemName[indexPath.row]
        cell.lblDescription?.text =  cartItem.cartItemDescription[indexPath.row]
        cell.lblPrice?.text =  cartItem.cartItemPrice[indexPath.row]
        cell.imgFoodItem.image=UIImage(named: cartItem.cartItemImage[indexPath.row])
        cell.imgFoodItem.layer.cornerRadius = 10
        cell.btnAddtoCart.layer.cornerRadius = 10
        return cell
    }   
    	
    static var SharedCategoryName:String = ""
    @IBOutlet weak var dishSlider: UICollectionView!
    @IBOutlet weak var restaurantSlider: UICollectionView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var AllRestaurentTableView: UITableView!
    var featuredImages:[String]=["mc_large","pizza_hut","Tim","burger_king","subway_large"]
    var dishimages:[String]=["pizza_1","chicken_wings","pasta_cream","fries_sauce","burgers"]
    @IBOutlet weak var topSlider: UICollectionView!
    var imgArr = [UIImage(named: "bakery"),UIImage(named: "cake-slice"),UIImage(named: "chicken-leg"),UIImage(named: "hamburger"),UIImage(named: "hot-soup"),UIImage(named: "momo"),UIImage(named: "pizza"),UIImage(named: "salad"),UIImage(named: "sandwhich")]
    var categoryArr = ["Bakery","Dessert","Chicken","Burger", "Soup","Momo", "Pizza","Salad", "Sandwhich"]
    var restaurantNameArr = ["McDonalds","Pizza Hut","Tim Hortons","Burger King", "Sub way"]
    var dishNameArr = ["Pizza","Chicken Wings","Pasta","French Fries", "Burgers"]
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let window = UIApplication.shared.windows[0]
        let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        let width = safeFrame.width
        let height = safeFrame.height
        if(collectionView == restaurantSlider || collectionView == dishSlider)
        {
            //(100 / () * 50)
             print(UIScreen.main.bounds.height)
            //collectionView.
            return CGSize(width: width * 0.70, height: height*0.20)
            
        }
        else
        {
           // label.text =  String(format: "%.2f", height*0.08)
            return CGSize(width:height*0.08, height: height*0.08)
        }
        return CGSize(width: 20, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        var Count = 0
        if(collectionView == restaurantSlider || collectionView == dishSlider)
        {
            return featuredImages.count
        }
        else
        {
            return imgArr.count
        }
        return Count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if(collectionView == restaurantSlider)
        {
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "singleCell", for: indexPath)
            as! RestaurentCollectionView
            cell.lblRestaurantName.text = restaurantNameArr[indexPath.row]           
            cell.imgRestaurant.image=UIImage(named: featuredImages[indexPath.row])
           
            cell.layer.cornerRadius = 10
            return cell
        }
        else if(collectionView == dishSlider)
        {
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "singleCell", for: indexPath)
            as! DishCollectionView
            cell.lblDishName.text = dishNameArr[indexPath.row]
            cell.imgDish.image=UIImage(named: dishimages[indexPath.row])
            cell.btnAddToCart.layer.cornerRadius = 10
            cell.btnAddToCart.tag = indexPath.row
            cell.btnAddToCart.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
            cell.layer.cornerRadius = 10
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopSliderCollection
            cell.foodIcons.image  = imgArr[indexPath.row]
            cell.lblDisplay.text = categoryArr[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.p
        if(collectionView == restaurantSlider)
        {
            let RestaurantName = restaurantNameArr[indexPath.row]
            let vc = self.storyboard?.instantiateViewController(identifier: "SingleRestaurantViewController") as!		 SingleRestaurantViewController
            vc.RestaurantName = RestaurantName
           // self.navigationController?.pushViewController(vc, animated: true)
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
            
        }
        if(collectionView == topSlider)
        {
            let CategoryName = categoryArr[indexPath.row]
            let vc = self.storyboard?.instantiateViewController(identifier: "SearchListViewController") as! SearchListViewController
            vc.CategoryName = CategoryName
            FeaturedViewController.SharedCategoryName = CategoryName
            //self.navigationController?.pushViewController(vc, animated: true)            
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: true, completion: nil)
            self.tabBarController?.selectedIndex = 1;
        }
    }
    
    @objc func subscribeTapped(_ sender: UIButton){
      // use the tag of button as index
        print(sender.tag)
        if(sender.tag == 0){
            cartItem.cartItemPrice.append("CAD 20");
            cartItem.cartItemName.append("French Fries");
            cartItem.cartItemDescription.append("Coke, Fries, Water bottle");
            cartItem.cartItemImage.append("fries_sauce");
        }
        if(sender.tag == 1)
        {
            cartItem.cartItemPrice.append("CAD 40");
            cartItem.cartItemName.append("French Fries 1");
            cartItem.cartItemDescription.append("Coke, Fries, Water bottle, Toppings");
            cartItem.cartItemImage.append("hamburger");
        }
        //CartViewController.TableViewCartItem.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        topSlider.delegate = self
        topSlider.dataSource = self
        restaurantSlider.delegate = self
        restaurantSlider.dataSource = self
        dishSlider.delegate = self
        dishSlider.dataSource = self
        AllRestaurentTableView.delegate = self
        AllRestaurentTableView.dataSource = self
        print(cartItem.cartItemPrice)
    }
}

class TopSliderCollection : UICollectionViewCell
{
    @IBOutlet weak var lblDisplay: UILabel!
    @IBOutlet weak var foodIcons: UIImageView!
}

class RestaurentCollectionView: UICollectionViewCell
{
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var imgRestaurant: UIImageView!
}

class DishCollectionView: UICollectionViewCell
{ 
    @IBOutlet weak var imgDish: UIImageView!  
    @IBOutlet weak var lblDishName: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
}

class AllRestaurentTableCell: UITableViewCell
{
    @IBOutlet weak var btnAddtoCart: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDishName: UILabel!
    @IBOutlet weak var imgFoodItem: UIImageView!
    
}


