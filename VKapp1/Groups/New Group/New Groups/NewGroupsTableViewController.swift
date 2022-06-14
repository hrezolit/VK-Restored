//
//  NewGroupsTableViewController.swift
//  VKapp1
//
//  Created by Nikita on 23/3/22.
//

import UIKit

protocol NewGroupsTableViewControllerDelegate {
    func userSubscribed(group: [GroupData])
}

class NewGroupsTableViewController: UITableViewController {
    
    var delegate: NewGroupsTableViewControllerDelegate?
    var unSubscribedGroups = [GroupData]()
    
    // MARK: - Table view data source
    
    // set the height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // the number of sections equals count of array items
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unSubscribedGroups.count
    }
    
    // cell data filling
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewGroupsCell1", for: indexPath) as? UnsubscribedTableViewCell
        let unSubscribedGroup = unSubscribedGroups[indexPath.row]
        cell?.unSubscribedGroupName.text = unSubscribedGroup.name
        cell?.unSubscribedGroupPicture.image = UIImage(named: unSubscribedGroup.photo100)
        
        return cell ?? UITableViewCell()
    }
    
    // adding subscribed groups by swiping button
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let subscribeAction = UISwipeActionsConfiguration(
            actions: [UIContextualAction(
                style: .normal,
                title: "Subscribe",
                handler: { _, _, block in
                    
                    tableView.beginUpdates()
                    
                    // Delete in unSubscribedGroups and move item in subscribedGroups
                    //            let subscribedGroup = self.unSubscribedGroups.remove(at: indexPath.item)
                    //            subscribedGroups.append(subscribedGroup)
                    
                    // Delete the row from the data source
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    
                    //            self.delegate?.userSubscribed(group: subscribedGroups)
                    
                    tableView.endUpdates()
                    
                    block(true)})])
        
        return subscribeAction
    }
}
