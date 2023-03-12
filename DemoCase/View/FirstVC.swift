//
//  FirstViewController.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit

class FirstVC: UIViewController {

    
    @IBOutlet weak var navBarView: XibView!
    @IBOutlet weak var firstTableView: UITableView!
    
    var viewModel = FirstVM()
    var selectedItem : TrackInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setTableViewConfig(table: firstTableView)
        viewModel.didDataFetchedCompletion = {
            DispatchQueue.main.async {
                self.firstTableView.reloadData()
            }
        }
        viewModel.didDetailClicked = { item in
            self.selectedItem = item
            self.performSegue(withIdentifier: "detailSegue", sender: nil)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.observerUpdate(_:)), name: .changeText, object: nil)
    }
    
    @objc func observerUpdate(_ sender : Notification) {
        let text = sender.userInfo?["newText"] as? String ?? ""
        print(text)
        NotificationCenter.default.post(name: .textUpdate, object: nil, userInfo: ["updateText" : text])
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
