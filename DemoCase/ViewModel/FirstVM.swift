//
//  FirstViewModel.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import Foundation
import UIKit

class FirstVM : NSObject {
    
    let apiService = Service()
    var itemList : [TrackInfo] = []
    var didDataFetchedCompletion : () -> () = { }
    var didDetailClicked : (TrackInfo) -> () = { item in}
    
    override init() {
        super.init()
        apiService.fetchData { reponse in
            guard let data = reponse.results else {return}
            self.itemList = data
            self.didDataFetchedCompletion()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.deleteItemObserver(_:)), name: .deleteItem, object: nil)
    }
    func setTableViewConfig(table : UITableView) {
        table.setDefaultConfig()
        table.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    @objc func deleteItemObserver(_ sender : Notification) {
        let trackID = sender.userInfo?["deleteItem"] as? Int ?? 0
        itemList.forEach { x in
            if x.trackId == trackID {
                itemList.remove(object: x)
                didDataFetchedCompletion()
            }
        }
    }
}

extension FirstVM : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstCell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
        firstCell.loadData(data: itemList[indexPath.row])
        return firstCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didDetailClicked(itemList[indexPath.row])
    }
    
}
