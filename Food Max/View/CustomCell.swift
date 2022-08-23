//
//  customCell.swift
//  Food Max
//
//  Created by Maxwell da Silva e Silva on 18/08/22.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    static let identifier: String = "CustomCell"
    static func nib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupCell(product: String, image: UIImage) {
        self.productLabel.text = product
        self.productImage.image = image
    }
    
}
