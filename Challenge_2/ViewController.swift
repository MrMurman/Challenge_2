//
//  ViewController.swift
//  Challenge_2
//
//  Created by Андрей Бородкин on 29.06.2021.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGoods))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearList))
        
        title = "Shopping List"
        shoppingList.append("TEST")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Goods", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    @objc func addGoods() {
        
        let ac = UIAlertController(title: "Enter shopping list item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] action in
            guard let item = ac?.textFields?[0].text else {return}
            
            self?.submit(item)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true, completion: nil)
            
        }
        
    @objc func clearList() {
        shoppingList.removeAll()
        tableView.reloadData()
    }
    

    func submit(_ goods: String) {
        
        //shoppingList.insert(goods, at: 0)
        shoppingList.append(goods)
        
        let indexPath = IndexPath(row: shoppingList.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        
    }
}

