//
//  FrinedsTableViewController.swift
//  VKapp1
//
//  Created by Nikita on 23/3/22.
//

import UIKit

struct SortingFriendsForHeader {
    var firstLetter: Character
    var friends: [FriendsData]
}

class FrinedsTableViewController: UITableViewController {
    
    /// service for fetching friend data
    let friendService = FriendService()
    
    /// friends data storage
    var friendsData = [FriendsData]()
    
    /// calculated property for extracting letters
    var friendFirstLetter: [SortingFriendsForHeader] {
        var result = [SortingFriendsForHeader]()
        
        for friend in friendsData {
            guard let character = friend.firstName.first else { continue }
            
            if let index = result.firstIndex(where: { $0.firstLetter == character } ) {
                result[index].friends.append(friend)
                
            } else {
                
                let sortedFriend = SortingFriendsForHeader(firstLetter: character, friends: [friend])
                result.append(sortedFriend)
            }
        }
        return result
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ACCESS_TOKEN: \(String(describing: MySession.shared.token))")
        
        friendService.loadFriendVK { result in
            switch result {
            case .success(let friend):
                DispatchQueue.main.async {
                    self.friendsData = friend
                    self.tableView.reloadData()
                }
                
            case .failure(_):
                return
            }
        }
        friendService.saveToRealm(friendsData)
        
        let myNib = UINib(nibName: "FriendsAlphabetHeaderView", bundle: .main)
        tableView.register(myNib, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendFirstLetter.count
    }
    
    // the number of sections equals count of array items
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friends = friendFirstLetter[section]
        return friends.friends.count
    }
    
    // customized header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? FriendsAlphabetHeaderView
        let friend = friendFirstLetter[section]
        view?.letterLabel.text = String(friend.firstLetter)
        
        return view
    }
    
    // cell data filling
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell") as? FriendViewCell
        
        let friend = friendFirstLetter[indexPath.section]
        let friendSection = friend.friends[indexPath.row]
        
        cell?.userName.text = friendSection.firstName + " " + friendSection.lastName
        cell?.userPicture.loadImage(with: friendSection.photo100)
    
        return cell ?? UITableViewCell()
    }
    
    // set the height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    // MARK: - Navigation
    
    // preparation for use selected cell picture -> sending in next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? FriendViewCell,
              let indexPath = tableView.indexPath(for: cell),
              let photoViewController = segue.destination as? PhotosCollectionViewController else { return }
        
        let friend = friendFirstLetter[indexPath.section]
        let friendSection = friend.friends[indexPath.row]
        
        photoViewController.friendIndex = friendsData.firstIndex(where: { $0.firstName == friendSection.firstName }) ?? 0
        photoViewController.photoOwnerID = friendSection.id
        photoViewController.title = friendSection.firstName
    }
}
