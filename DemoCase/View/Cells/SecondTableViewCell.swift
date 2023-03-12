//
//  SecondTableViewCell.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    static let identifier = "SecondTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.cardView()
    }
    
    func loadData(data : TrackInfo) {
        artistLabel.text = data.artistName
        trackLabel.text = data.trackName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
