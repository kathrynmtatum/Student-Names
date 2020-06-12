//
//  ViewController.swift
//  Student Names
//
//  Created by Kathryn Tatum on 3/9/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Shane Barys",
    "Brandon Boey",
    "Sydney Boyd",
    "Jiayi Cheng",
    "Wanli Cheng",
    "Bradley Ehrlich",
    "Alexander Falcone",
    "Darwie Fang",
    "Harrison Fish",
    "Kyle Gangi",
    "Kathleen Garrity",
    "Christopher Greene",
    "Cheng Hsieh",
    "Hannah Jiang",
    "Dae Kim",
    "Dongeun Lee",
    "Jiahong Li",
    "Yi Li",
    "Huiyi Lyu",
    "Yidan Ma",
    "Ronan Manvelian",
    "Patrick McDonough",
    "Aashay Patel",
    "Lucas Pomeroy",
    "Cooper Schmitz",
    "Aidan Shea",
    "Wangzhuo Shi",
    "Robert Smithers",
    "Matthew Spana",
    "Connor Sullivan",
    "William Tarzikhan",
    "Kathryn Tatum",
    "William Templeton",
    "Benjamin Tsai",
    "Thomas Wade",
    "Christopher Ware",
    "Jun Whang",
    "Dawin Ye",
    "Heesu Yun",
    "Zehua Zhang"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStudent" {
            let destination = segue.destination as!
                StudentDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.student = students[selectedIndexPath.row]
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    @IBAction func unwindFromDetailViewController(segue: UIStoryboardSegue) {
        let source = segue.source as! StudentDetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            students[selectedIndexPath.row] = source.student
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: students.count, section: 0)
            students.append(source.student)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection was just called and there are \(students.count) rows in the tableView 👊🏻")
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        print("🌟 dequeing the tableView cell for indexPath.row = \(indexPath.row) where the cell contains item \(students[indexPath.row])")
        return cell
    }
    
    
}
