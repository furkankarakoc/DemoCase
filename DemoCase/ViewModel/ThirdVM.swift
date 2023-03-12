//
//  ThirdViewModel.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import Foundation
import UIKit

class ThirdVM : NSObject {
    
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
    
    func setCollectionViewConfig(collection : UICollectionView) {
        collection.register(ThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: ThirdCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
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
extension ThirdVM : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.identifier, for: indexPath) as! ThirdCollectionViewCell
        thirdCell.loadData(data: itemList[indexPath.row])
        return thirdCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let padding = 2
            let width = (collectionView.frame.size.width - CGFloat(padding) * 2) / CGFloat(2)
            let height = width / 200 * 100 
            return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didDetailClicked(itemList[indexPath.row])
    }
    
}
