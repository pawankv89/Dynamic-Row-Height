//
//  ViewController.swift
//  Dynamic Row Height
//
//  Created by Pawan kumar on 30/04/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit

struct ListItem {
    let id : String
    let title : String
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var listArray = [ListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Latest Hindi Movies
        
        self.listArray = [
        
            ListItem.init(id: "Code Name Abdul", title: "Tanishaa Mukerji, Deepak Ravella, Akku Kulhari, Ashok Chaudhary,"),
            ListItem.init(id: "Ludo", title: "Abhishek Bachchan, Rajkummar Rao, Aditya Roy Kapur, Pankaj Tripathi, Sanya Malhotra, Fatima Sana Sheikh"),
            ListItem.init(id: "Gunjan Saxena: The Kargil Girl", title: "Janhvi Kapoor, Pankaj Tripathi, Angad Bedi, Manav Vij, Vicky Ahuja,"),
            ListItem.init(id: "Lootcase", title: "Ranvir Shorey, Kunal Khemu, Rasika Dugal, Gajraj Rao, Vijay Raaz,"),
            ListItem.init(id: "Darbaan", title: "Sharib Hashmi, Sharad Kelkar, Rasika Dugal, Flora Saini, Harsh Chhaya"),
            ListItem.init(id: "Angrezi Medium", title: "Irrfan Khan, Kareena Kapoor, Pankaj Tripathi, Radhika Madan,")
        ]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // For Row Change Height at Run Time
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50 // Always Greater than 0
        
        // Refresh List
        self.reload_list()
    }

    func reload_list() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: ListCell? = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier) as? ListCell
        if (cell == nil)
        {
            let nib: Array = Bundle.main.loadNibNamed(ListCell.identifier, owner: self, options: nil)!
            cell = nib[0] as? ListCell
        }
        
        let list = self.listArray[indexPath.row]
    
        //Set Values
        cell!.titleLabel.text = list.title
        
        return cell!
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //list
        let list = self.listArray[indexPath.row]
        print("list ", list.title)
    }
}



