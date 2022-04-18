//Created by sohilmahammad liyakatali polara
//These are the classes created to handle da

import UIKit

class DataController {
  //This array is defined as static so that it can be access by all controllers without a need to create an object of class data
  static var FoodCategory = ["Bakery","Dessert","Chicken","Burger", "Soup","Momo", "Pizza","Salad", "Sandwhich"]
  static var FoodCategoryImage = ["tl_bakery","tl_cake-slice","tl_chicken-leg","tl_hamburger", "tl_hot-soup","tl_momo", "tl_pizza","tl_salad", "tl_sandwhich"]
  static var Restaurants = [Restaurant]() 
  static var FoodItems = [FoodItem]()
}

class Restaurant {
  var RestaurantsName:String
  var Description:String
  var HotelImage:String
  var HotelRating:Int
  public init(_ name: String,_ description:String,_ image:String,_ rating: Int) {
    self.RestaurantsName = name
    self.Description = description
    self.HotelImage = image
    self.HotelRating = rating
  }
}

class FoodItem {
      var HotelName:String
      var ItemName:String
      var ItemDescription:String
      var Price:String
      var ItemImage:String
      var FoodRating:Int
      public init(_ hotelname:String,_ itemname:String,_ itemdescription:String,_ price:String,_ image:String,_ rating:Int){
        self.HotelName = hotelname
        self.ItemName = itemname
        self.ItemDescription = itemdescription
        self.Price = price
        self.ItemImage = image
        self.FoodRating = rating
      }
}
