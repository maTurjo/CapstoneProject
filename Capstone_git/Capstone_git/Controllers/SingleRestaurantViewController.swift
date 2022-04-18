//  Created by Mihirkumar Bhoi


import UIKit

class SingleRestaurantViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var RestaurantName = "";
    var FoodName = "";
    var foodItemArr = DataController.FoodItems
    override func viewDidLoad() {        
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self        
        lblRestaurantName.text = RestaurantName
        foodItemArr = DataController.FoodItems.filter{$0.HotelName == RestaurantName}
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foodItemArr.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cel1",for:indexPath) as! FoodTableCell
            cell.FoodName.text = foodItemArr[indexPath.row].ItemName
            cell.FoodImage.image = UIImage(named: foodItemArr[indexPath.row].ItemImage)
            cell.FoodPrice.text = foodItemArr[indexPath.row].Price
            cell.addToCart.tag = indexPath.row
            cell.addToCart.addTarget(self, action: #selector(addtoCartTapped(_:)), for: .touchUpInside)
            return cell
    }
     
    @objc func addtoCartTapped(_ sender: UIButton)
    {
        cartItem.cartItemPrice.append(foodItemArr[sender.tag].Price);
        cartItem.cartItemName.append(foodItemArr[sender.tag].ItemName);
        cartItem.cartItemDescription.append(foodItemArr[sender.tag].ItemDescription);
        cartItem.cartItemImage.append(foodItemArr[sender.tag].ItemImage);
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

/*
// MARK: - RestaurantElement
struct RestaurantElement: Codable {
    let resName: String
    let menu: [Menu]

}

// MARK: - Menu
struct Menu: Codable {
    let foodName, foodImage, foodPrice: String

}
 */


class FoodTableCell : UITableViewCell{
    
    @IBOutlet weak var FoodImage: UIImageView!
    @IBOutlet weak var FoodName: UILabel!
    @IBOutlet weak var FoodPrice: UILabel!
    
    @IBOutlet weak var addToCart: UIButton!
    @IBAction func AddToCart(_ sender: UIButton) {
    }
}


class foodItem
{
    static var foodItemName:[String]=["Pizza","Wings","Burger","Pasta","Fries"]
    static var foodItemPrice:[String]=["CAD 12.00","CAD 15.00","CAD 7.00","CAD 9.00","CAD 6.00"]
    static var foodItemImage:[String]=["pizza.png","wings.png","burger.png","pasta.png","fries.png"]
 
}
