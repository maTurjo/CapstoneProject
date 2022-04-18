//
//  AppDelegate.swift
//  Capstone_git
//
//  Created by user202461 on 3/19/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Common data accessible by all controllers - created by Sohilmahammad Liyakatali Polara-------------------------
        DataController.Restaurants.append(Restaurant("McDonalds","Bakery, Chicken ,Fish, Burgers, Wraps","mc_large",5))
        DataController.Restaurants.append(Restaurant("Pizza Hut","Wings, Pizza, Sandwhichs, Italian, Salads","pizza_hut",5))
        DataController.Restaurants.append(Restaurant("Tim Hortons","Coffee, Sandwhichs, Burgers, Salads, Tea, Doughnuts, Momo","Tim",5))
        DataController.Restaurants.append(Restaurant("Burger King","Original Burger,Greek Salad,BBQ Chicken Salad,Shakes,Sandwhich","burger_king",5))
        DataController.Restaurants.append(Restaurant("Sub Way","Wraps,Cookies,Taco,Breads","subway_large",5))
        DataController.Restaurants.append(Restaurant("Boston Pizza","Wings, Pizza, Sandwhichs, Italian, Salads","domi.png",4))
        DataController.Restaurants.append(Restaurant("Boston Maggie","Wings, Pizza, Sandwichs, Italian, Salads","mc.png",4))
        DataController.Restaurants.append(Restaurant("Boston Pizza","Wings, Pizza, Sandwhichs, Italian, Salads, Dessert","domi.png",3))
        DataController.Restaurants.append(Restaurant("Boston Maggie","Wings, Pizza, Sandwhichs, Italian, Salads, Chicken","mc.png",3))
        DataController.Restaurants.append(Restaurant("Tim Hortons","Coffee, Sandwhichs, Burgers, Salads, Tea, Doughnuts, Momo","tims.png",3))
        DataController.Restaurants.append(Restaurant("Wendys","Coffee, Soft drink, Smoothy, Milkshake, Cake, Browney","wendys.png",3))
        DataController.Restaurants.append(Restaurant("Boston Chicken","Chicken Burger, Chicken Wings, Cocacola","boston.png",3))
        DataController.Restaurants.append(Restaurant("Habit","Original Burger,Greek Salad,BBQ Chicken Salad,Shakes,Sandwhich","habit.png",3))
        DataController.Restaurants.append(Restaurant("Subway","Wraps,Cookies,Taco,Breads","subway.png",3))
        DataController.Restaurants.append(Restaurant("Harvey","Sandwhich,Burgers,Colddrinks","Harvey.jpeg",3))
        DataController.Restaurants.append(Restaurant("NYC","Fries,Cold Drink","nyc.png",3))
        DataController.Restaurants.append(Restaurant("Red Lobster","Mashed Patatoes,Crab","boston.png",3))
        DataController.Restaurants.append(Restaurant("Boston Maggie","Original Burger,Greek Salad,BBQ ","Red.jpeg",3))
        DataController.Restaurants.append(Restaurant("Baskin Robins","Original Burger,Greek Salad,BBQ Chicken Salad,Shakes","boston.png",3))
        DataController.Restaurants.append(Restaurant("Wendys","Coffee, Soft drink, Smoothy, Milkshake, Cake, Browney","wendys.png",3))
        DataController.Restaurants.append(Restaurant("Boston Pizza","Wings, Pizza, Sandwhichs, Italian, Salads","domi.png",3))    
        
        DataController.FoodItems.append(FoodItem("McDonalds","Pizza","","CAD 12.00","pizza_1.png",5))
        DataController.FoodItems.append(FoodItem("McDonalds","Wings","","CAD 15.00","chicken_wings.png",5))
        DataController.FoodItems.append(FoodItem("McDonalds","Burger","","CAD 7.00","burgers.png",5))
        DataController.FoodItems.append(FoodItem("McDonalds","Pasta","","CAD 9.00","pasta_cream.png",5))
        DataController.FoodItems.append(FoodItem("McDonalds","Fries","","CAD 6.00","fries_sauce.png",5))
        
        DataController.FoodItems.append(FoodItem("Pizza Hut","Pizza","","CAD 12.00","pizza.png",4))
        DataController.FoodItems.append(FoodItem("Pizza Hut","Wings","","CAD 15.00","wings.png",4))
        DataController.FoodItems.append(FoodItem("Pizza Hut","Burger","","CAD 7.00","burger.png",4))
        DataController.FoodItems.append(FoodItem("Pizza Hut","Pasta","","CAD 9.00","pasta.png",4))
        DataController.FoodItems.append(FoodItem("Pizza Hut","Fries","","CAD 6.00","fries.png",4))
        
        DataController.FoodItems.append(FoodItem("Tim Hortons","French Vanilla","S M L","CAD 4.25","coffee",4))
        DataController.FoodItems.append(FoodItem("Tim Hortons","Vanilla Latte","S M L","CAD 3.00","latte",4))
        DataController.FoodItems.append(FoodItem("Tim Hortons","Tea","S M L","CAD 2.25","tea",4))
        
        DataController.FoodItems.append(FoodItem("Burger King","Hamburger","Small Big","CAD 9.00","hamburger",3))
        DataController.FoodItems.append(FoodItem("Burger King","Cheese Burger","Small Big","CAD 12.00","cheeseburger",3))
        DataController.FoodItems.append(FoodItem("Burger King","Fries","Small Big","CAD 8.00","fries_sauce",4))

        DataController.FoodItems.append(FoodItem("Subway","Salad","S M L","CAD 14.00","salad",4))
        DataController.FoodItems.append(FoodItem("Subway","Coke","S L XL","CAD 2.00","coke",3))
        DataController.FoodItems.append(FoodItem("Subway","Wrap","7 inch Foot-Long","CAD 12.00","wrap",5))

        DataController.FoodItems.append(FoodItem("Boston Pizza","Pizza","S M L","CAD 13.00","bppizza",4))
        DataController.FoodItems.append(FoodItem("Boston Pizza","Coke","S L XL","CAD 2.25","coke",4))
        DataController.FoodItems.append(FoodItem("Boston Pizza","Cheeseburger","M L","CAD 12.00","cheeseburger",5))

        DataController.FoodItems.append(FoodItem("Boston Maggi","Pinapple maggi","S L","CAD 7.25","pinamaggi",3))
        DataController.FoodItems.append(FoodItem("Boston Maggi","Egg maggi","s M L","CAD 9.00","eggmaggi",4))
        //Common data accessible by all controllers - created by Sohilmahammad Liyakatali Polara-----------------------
     
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

