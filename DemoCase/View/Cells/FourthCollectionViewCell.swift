//
//  FourthCollectionViewCell.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit
import SDWebImage

protocol SelectedItemDeleteProtocol {
    func deleteSelectedItem(trackID: Int)
}


class FourthCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FourthCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FourthCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var delegate: SelectedItemDeleteProtocol? = nil
    var trackID = Int()
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.cardView()
    }

    func loadData(data : TrackInfo) {
        artistLabel.text = data.artistName
        trackLabel.text = data.trackName
        dateLabel.text = data.releaseDate?.getDisplayDate() ?? ""
        priceLabel.text = data.trackPrice?.getCurrency ?? ""
        let imageUrl = URL(string: data.artworkUrl100)
        fourthImageView.sd_setImage(with: imageUrl, completed: nil)
        trackID = data.trackId ?? 0
    }

    @IBAction func deleteItemClicked(_ sender: UIButton) {
        delegate?.deleteSelectedItem(trackID: trackID)
    }
}
