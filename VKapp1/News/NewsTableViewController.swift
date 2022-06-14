//
//  NewsTableViewController.swift
//  VKapp1
//
//  Created by Nikita on 9/4/22.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let myNewsData = news
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNewsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewsTableViewCell {
            
            let post = myNewsData[indexPath.row]
            cell.postedImage.image = UIImage(named: post.postedImage)
            cell.whoPostedImage.image = UIImage(named: post.whoPostedImage)
            cell.postDate.text = post.postDate
            cell.whoPostedName.text = post.whoPostedName
            cell.postTitle.text = post.postTitle
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 510
    }
    
}
