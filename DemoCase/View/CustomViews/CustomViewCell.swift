//
//  CellCustomView.swift
//  DemoCase
//
//  Created by Furkan on 11.03.2023.
//

import UIKit

class CustomViewCell: UIView {

    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var customLabel: UILabel!
    
    override init(frame : CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
