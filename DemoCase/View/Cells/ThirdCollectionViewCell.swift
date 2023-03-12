//
//  ThirdCollectionViewCell.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {

    static let identifier = "ThirdCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ThirdCollectionViewCell", bundle: nil)
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
}
