//
//  TaskDetailViewController.swift
//  CoreDataTest
//
//  Created by qingjiezhao on 7/6/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var txtField: UITextField!
    
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as! AppDelegate).managedObjectContext
    
    var task : Task? = nil
    
    @IBAction func done(sender: AnyObject) {
        if task != nil{
            editTask()
        }else{
            createTask()
        }
        dismissViewController()
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewController()
    }
    
    
    func dismissViewController() {
        navigationController?.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if task != nil {
            txtField.text = task?.desc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func createTask(){
        let entityDescription = NSEntityDescription.entityForName("Task", inManagedObjectContext: managedObjectContext!)
        let task = Task(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        task.desc = txtField.text
        managedObjectContext?.save(nil)
    }
    
    func editTask(){
        task?.desc = txtField.text
        managedObjectContext?.save(nil)
    }
    

}
