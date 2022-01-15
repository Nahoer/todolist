//
//  ViewController.swift
//  MonPremierTableView
//
//  Created by Naoher on 14/01/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var cell: UIView!
    
    var myData = [MyData]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func switchOnChange(_ sender: UISwitch) {
        myData[sender.tag].isDone=sender.isOn

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
        myTableView.dataSource = self
    }
    
    @IBAction func deleteOnClick(_ sender: UIButton) {
        myData.remove(at: sender.tag)
        myTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.tag = indexPath.row
        cell.done.tag = indexPath.row
        cell.myTitle.text = myData[indexPath.row].title
        cell.dateTodo.text = myData[indexPath.row].dateToString()
        cell.done.isOn = myData[indexPath.row].isDone

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Find the row of the cell
            let row = indexPath.row
            myData.remove(at: row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    @IBAction func unwindToMainView(_ unwindSegue: UIStoryboardSegue) {
        let addViewController = unwindSegue.source as! AddViewController
        if unwindSegue.identifier == "cancel" {
            addViewController.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier != "save" {
            return
        }
        if let myTitle = addViewController.myTitle.text,
           let date = addViewController.dateTodo {
           let new_data = MyData(title: myTitle,
                                 date: date.date)
                myData.append(new_data)
                myTableView.reloadData()
            }
        // Use data from the view controller which initiated the unwind segue
    }


}

