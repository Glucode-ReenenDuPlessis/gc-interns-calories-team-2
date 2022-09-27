//
//  ViewController.swift
//  SampleAPICall
//
//  Created by Sibusiso Mbonani on 2022/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var food: UITextField!
    let dp = DataProvider()
//    let api = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FoodItemCell", bundle: nil), forCellReuseIdentifier: "foodItemCell")
    }

    @IBAction func getTapped(_ sender: UIButton) {
        
        dp.parseJSON(getFood: food.text!){ [self] in
            if let foodArray = dp.foods {
                
                for foodHints in foodArray.hints{
                               
                    tableView.reloadData()
                    self.viewDidLoad()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = dp.foods?.hints[indexPath.row]
        let serving = "per serving"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodItemCell") as! FoodItemCell
    
        cell.setUpCell(foodName: (food?.food.label)!, pic: food?.food.image, calory: food?.food.nutrients.ENERC_KCAL ?? 0.0, serving: serving)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dp.foods?.hints.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.selectedFood = dp.foods?.hints[tableView.indexPathForSelectedRow!.row]
           
        }
    }
}


//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    
//
//    
//    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}
