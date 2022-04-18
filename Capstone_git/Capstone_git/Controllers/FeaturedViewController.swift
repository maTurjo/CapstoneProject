//Created by Sohilmahammad Liyakatali Polara

import UIKit


class FeaturedViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource  {
    	
    //Variables and outlets Declarations-------------------------
    static var SharedCategoryName:String = ""
    @IBOutlet weak var dishSlider: UICollectionView!
    @IBOutlet weak var restaurantSlider: UICollectionView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var AllRestaurentTableView: UITableView!
    @IBOutlet weak var topSlider: UICollectionView!
    var restaurantNameArr = DataController.Restaurants.filter{$0.HotelRating == 5} //Select Retaurants with 5 ratings.
    var foodItemArr = DataController.FoodItems.filter{$0.FoodRating == 5}
    //Variable and outlets Declarations-------------------------
    
    
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
    
    //This functions returns number of rows for the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataController.FoodItems.count
    }
    
    //This functions excutes for every row of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",for:indexPath) as! AllRestaurentTableCell
        cell.lblDishName?.text =  DataController.FoodItems[indexPath.row].ItemName
        cell.lblDescription?.text =  DataController.FoodItems[indexPath.row].ItemDescription
        cell.lblPrice?.text =  DataController.FoodItems[indexPath.row].Price
        cell.imgFoodItem.image=UIImage(named: DataController.FoodItems[indexPath.row].ItemImage)
        cell.imgFoodItem.layer.cornerRadius = 10
        cell.btnAddtoCart.layer.cornerRadius = 10
        cell.btnAddtoCart.tag = indexPath.row
        cell.btnAddtoCart.addTarget(self, action: #selector(addtoCartTappedForForAllCousines(_:)), for: .touchUpInside)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let window = UIApplication.shared.windows[0]
        let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        let width = safeFrame.width
        let height = safeFrame.height
        if(collectionView == restaurantSlider || collectionView == dishSlider)
        {
            return CGSize(width: width * 0.70, height: height*0.20)
        }
        else
        {
            return CGSize(width:height*0.08, height: height*0.08)
        }
        return CGSize(width: 20, height: 50)
    }
    
    //This function returns count of collection view items for every collection views on the screen
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        var Count = 0
        if(collectionView == restaurantSlider)
        {
            return restaurantNameArr.count
        }
        else if (collectionView == dishSlider)
        {
            return foodItemArr.count
        }
        else
        {
            return DataController.FoodCategory.count
        }
        return Count
    }
    
    //This fucntion is executed for every row for collection views on the screen
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if(collectionView == restaurantSlider)
        {
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "singleCell", for: indexPath)
            as! RestaurentCollectionView
            cell.lblRestaurantName.text = restaurantNameArr[indexPath.row].RestaurantsName
            cell.imgRestaurant.image = UIImage(named: restaurantNameArr[indexPath.row].HotelImage)
            cell.layer.cornerRadius = 10
            return cell
        }
        else if(collectionView == dishSlider)
        {
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "singleCell", for: indexPath)
            as! DishCollectionView
            cell.lblDishName.text = foodItemArr[indexPath.row].ItemName
            cell.imgDish.image=UIImage(named: foodItemArr[indexPath.row].ItemImage)
            cell.btnAddToCart.layer.cornerRadius = 10
            cell.btnAddToCart.tag = indexPath.row
            cell.btnAddToCart.addTarget(self, action: #selector(addtoCartTappedForForMostOrderedDishes(_:)), for: .touchUpInside)
            cell.layer.cornerRadius = 10
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopSliderCollection
            cell.foodIcons.image  = UIImage(named:  DataController.FoodCategoryImage[indexPath.row])
            cell.lblDisplay.text =  DataController.FoodCategory[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    //This function called when user clickes on a collection view item.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.p
        if(collectionView == restaurantSlider)
        {
            let RestaurantName = restaurantNameArr[indexPath.row].RestaurantsName
            let vc = self.storyboard?.instantiateViewController(identifier: "SingleRestaurantViewController") as! SingleRestaurantViewController
            vc.RestaurantName = RestaurantName
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)  
        }
        if(collectionView == topSlider)
        {
            let CategoryName = DataController.FoodCategory[indexPath.row]
            let vc = self.storyboard?.instantiateViewController(identifier: "SearchListViewController") as! SearchListViewController
            vc.CategoryName = CategoryName
            FeaturedViewController.SharedCategoryName = CategoryName
            self.tabBarController?.selectedIndex = 1;
        }
    }
    
    //This function is called when user clicks on the add to cart button from the horizontal dish slider
    @objc func addtoCartTappedForForMostOrderedDishes(_ sender: UIButton)
    {
       //use the tag of button as index
        cartItem.cartItemPrice.append(foodItemArr[sender.tag].Price);
        cartItem.cartItemName.append(foodItemArr[sender.tag].ItemName);
        cartItem.cartItemDescription.append(foodItemArr[sender.tag].ItemDescription);
        cartItem.cartItemImage.append(foodItemArr[sender.tag].ItemImage);
    }
    
    //This function is called when user clicks on the all dish table view
    @objc func addtoCartTappedForForAllCousines(_ sender: UIButton)
    {
       //use the tag of button as index
        cartItem.cartItemPrice.append(DataController.FoodItems[sender.tag].Price);
        cartItem.cartItemName.append(DataController.FoodItems[sender.tag].ItemName);
        cartItem.cartItemDescription.append(DataController.FoodItems[sender.tag].ItemDescription);
        cartItem.cartItemImage.append(DataController.FoodItems[sender.tag].ItemImage);
        
    }
}


//All below classes are kept in this file to make it more easy to read the code.
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



