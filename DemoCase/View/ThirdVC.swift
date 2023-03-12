//
//  ThirdViewController.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet weak var navBarView: XibView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    var viewModel = ThirdVM()
    var selectedItem : TrackInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setCollectionViewConfig(collection: thirdCollectionView)
        viewModel.didDataFetchedCompletion = {
            DispatchQueue.main.async {
                self.thirdCollectionView.reloadData()
            }
        }
        viewModel.didDetailClicked = { item in
            print(item)
            self.selectedItem = item
            self.performSegue(withIdentifier: "detailSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let detailVc = segue.destination as? DetailVC {
                guard let data = selectedItem else { return }
                detailVc.updateUI(data: data)
            }
        }
    }

}
