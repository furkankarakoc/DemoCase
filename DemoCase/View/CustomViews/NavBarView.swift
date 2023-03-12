//
//  NavBarView.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit

class NavBarView: UIView {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var navBarImageView: UIImageView!
    @IBOutlet weak var navBarNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editPop))
        self.backView.isUserInteractionEnabled = true
        self.backView.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(self.textUpdate(_:)), name: .textUpdate, object: nil)
    }
    
    @objc func textUpdate(_ sender : Notification) {
        let text = sender.userInfo?["updateText"] as? String ?? ""
        navBarNameLabel.text = text
    }
    
    @objc func editPop() {
        openEditAlert()
    }
    

    func openEditAlert() {
        let alert = UIAlertController (title: "Please Enter Your Name/Surname:", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.destructive, handler: nil)
            alert.addAction(cancel)

        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in print("OK")
            let textfield = alert.textFields?[0]
            print(textfield?.text!)
            self.navBarNameLabel.text = textfield?.text!
            NotificationCenter.default.post(name: .changeText, object: nil, userInfo: ["newText" : textfield?.text!])
        }

        alert.addAction(okAction)
        alert.addTextField { (textfield: UITextField) in
            textfield.placeholder = "Name/Surname"
        }
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
