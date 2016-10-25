//
//  ViewController.swift
//  DoIt
//
//  Created by Marc Streeter on 10/24/16.
//  Copyright © 2016 Developer Warriors. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
   
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    tasks = makeTasks()
        
        tableView.dataSource = self
    tableView.delegate = self
    
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important{
         cell.textLabel?.text = "❗️\(task.name)"
        }else{
          cell.textLabel?.text = task.name
        }
        
        return cell
    }
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Take care of baby"
        task1.important = true

        let task2 = Task()
        task2.name = "Buy SnowBoard"
        task2.important = false

        let task3 = Task()
        task3.name = "Buy food"
        task3.important = true

        return[task1,task2,task3]
        
    }

    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    
    }
}

