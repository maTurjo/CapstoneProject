//
//  SingleRestaurantViewController.swift
//  Capstone_git
//
//  Created by user202461 on 3/24/22.
//

import UIKit

class SingleRestaurantViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var RestaurantName = "";
    var FoodName = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        lblRestaurantName.text = RestaurantName
        // Do any additional setup after loading the view.
        // do catch in case of error
        //print(Bundle.main.path(forResource: "Restuarents", ofType: "json"))
        
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foodItem.foodItemName.count
        }
            
      
        //Fill the table view with todo lost
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cel1",for:indexPath) as! FoodTableCell
            //let food = menu[indexPath.row]
            cell.FoodName.text = foodItem.foodItemName[indexPath.row]
            cell.FoodImage.image = UIImage(named: foodItem.foodItemImage[indexPath.row])
            //cell.FoodName.text = foodItem.foodItemName[indexPath.row]
            cell.FoodPrice.text = foodItem.foodItemPrice[indexPath.row]
            cell.addToCart.tag = indexPath.row
            cell.addToCart.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
            //print(".\(menu.count) result ")
            return cell
        }
     
    @objc func subscribeTapped(_ sender: UIButton){
      // use the tag of button as index
        print(sender.tag)
        if(sender.tag == 0){
            foodItem.foodItemPrice.append("CAD 12.00");
            foodItem.foodItemName.append("Pizza");
            foodItem.foodItemImage.append("pizza.png");
        }
        if(sender.tag == 1)
        {
            foodItem.foodItemPrice.append("CAD 15.00");
            foodItem.foodItemName.append("Wings");
            foodItem.foodItemImage.append("wings.png");
        }
        if(sender.tag == 2)
        {
            foodItem.foodItemPrice.append("CAD 7.00");
            foodItem.foodItemName.append("Burger");
            foodItem.foodItemImage.append("burger.png");
        }
        if(sender.tag == 3)
        {
            foodItem.foodItemPrice.append("CAD 9.00");
            foodItem.foodItemName.append("Pasta");
            foodItem.foodItemImage.append("pasta.png");
        }
        if(sender.tag == 4)
        {
            foodItem.foodItemPrice.append("CAD 6.00");
            foodItem.foodItemName.append("Fries");
            foodItem.foodItemImage.append("fries.png");
        }
        //CartViewController.TableViewCartItem.reloadData()
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
