//
//  Extensions.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import Foundation
import UIKit


extension UITableView {
    func setDefaultConfig() {
        backgroundColor = .clear
        backgroundView = nil
        rowHeight = UITableView.automaticDimension
        sectionHeaderHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension
        separatorStyle = .none
    }
}
extension UIViewController {
    
    func makeAlert(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIView {
    func cardView() {
        self.backgroundColor = .systemBackground
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
    }
}

extension Formatter {

    static let getCurrency : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter
    }()
}

extension Numeric {
    var getCurrency : String { return Formatter.getCurrency.string(for: self) ?? ""}
}

extension String {
    func getDisplayDate() -> String{
            var dateText = ""
            let dateSplit = split(separator: "T")
            if(dateSplit.count > 0){
                let dateFormatter = DateFormatter(dateFormat: "yyyy-MM-dd")
                if let date2 = dateFormatter.date(from:String(dateSplit[0])){
                    dateText = DateFormatter().dateToString(date: date2, format: "dd.MM.yyyy")
                }
            }
            return dateText
        }
}

extension DateFormatter{
    func dateToString(date:Date, format:String) -> String {
        locale = Locale(identifier: "tr_tr")
        setLocalizedDateFormatFromTemplate(format)
        return string(from: date)
    }
    
    convenience init(dateFormat:String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

extension NSNotification.Name {
    static let changeText = NSNotification.Name("changeText")
    static let textUpdate = NSNotification.Name("textUpdate")
    static let deleteItem = NSNotification.Name("deleteItem")
}

extension Array where Element: Equatable {
   mutating func remove(object: Element) {
       guard let index = firstIndex(of: object) else {return}
       remove(at: index)
   }

}



