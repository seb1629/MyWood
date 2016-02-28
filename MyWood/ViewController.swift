//
//  ViewController.swift
//  MyWood
//
//  Created by SEBASTIEN MONTIBELLER on 25/02/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPosts()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postLoaded", object: nil)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1    
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPost[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 75.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPost.count
    }
    
    func onPostsLoaded(notif: AnyObject){
        tableView.reloadData()
    }
    
}

