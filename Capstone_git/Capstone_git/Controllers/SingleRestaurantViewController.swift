//
//  SingleRestaurantViewController.swift
//  Capstone_git
//
//  Created by user202461 on 3/24/22.
//

import UIKit

class SingleRestaurantViewController: UIViewController {

    @IBOutlet weak var lblRestaurantName: UILabel!
    var RestaurantName = "";
    var FoodName = "";
    var restaurant:[RestaurantElement] = []
    var menu:[Menu] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        lblRestaurantName.text = RestaurantName
        // Do any additional setup after loading the view.
        // do catch in case of error
        if let fileLocation = Bundle.main.path(forResource: "food", ofType: "json")
        {
            // do catch in case of error
            do
            {
                let data = try Data.init(contentsOf: URL(fileURLWithPath: fileLocation))
                let JsonDecoder = JSONDecoder()
                let datafromJson = try JsonDecoder.decode([RestaurantElement].self, from: data)
                restaurant  = datafromJson.filter{$0.resName == RestaurantName }
                let foodDatafromJson = try JsonDecoder.decode([Menu].self, from: data)
                menu = foodDatafromJson.filter{$0.foodName == FoodName}
            }
            catch
            {
                print(error)
            }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restaurant.count
        }
            
      
        //Fill the table view with todo lost
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cel1",for:indexPath) as! FoodTableCell
            let food = menu[indexPath.row]
            //cell.lblResName?.text = restaurent.name
            //cell.FoodImage = UIImage(named: foodImage)
            //cell.FoodName.text = foodName
            //cell.FoodPrice.text = foodPrice
            return cell
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

}

// MARK: - RestaurantElement
struct RestaurantElement: Codable {
    let resName: String
    let menu: [Menu]

}

// MARK: - Menu
struct Menu: Codable {
    let foodName, foodImage, foodPrice: String

}


class FoodTableCell : UITableViewCell{
    
    @IBOutlet weak var FoodImage: UIImageView!
    @IBOutlet weak var FoodName: UILabel!
    @IBOutlet weak var FoodPrice: UILabel!
    
    @IBAction func AddToCart(_ sender: UIButton) {
    }
}

