//
//  SecondViewModel.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import Foundation
import UIKit

class SecondVM : NSObject {
    
    let apiService = Service()
    var itemList : [TrackInfo] = []
    var didDataFetchedCompletion : (Int) -> () = {count in}
    var didDetailClicked : (TrackInfo) -> () = { item in}
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(self.deleteItemObserver(_:)), name: .deleteItem, object: nil)
    }
    
    func getData() {
        apiService.fetchData { reponse in
            guard let data = reponse.results else {return}
            self.itemList = data
            self.didDataFetchedCompletion(self.itemList.count)
        }
    }

    func setTableViewConfig(table : UITableView) {
        table.setDefaultConfig()
        table.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    @objc func deleteItemObserver(_ sender : Notification) {
        let trackID = sender.userInfo?["deleteItem"] as? Int ?? 0
        itemList.forEach { x in
            if x.trackId == trackID {
                itemList.remove(object: x)
                didDataFetchedCompletion(itemList.count)
            }
        }
    }
}

extension SecondVM : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let secondCell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
        secondCell.loadData(data: itemList[indexPath.row])
        return secondCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didDetailClicked(itemList[indexPath.row])
    }
}
