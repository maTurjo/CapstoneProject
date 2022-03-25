//
//  CategoryViewController.swift
//  Capstone_git
//
//  Created by user202461 on 3/24/22.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var lblCategoryName: UILabel!
    var CategoryName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        lblCategoryName.text = CategoryName
        // Do any additional setup after loading the view.
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
