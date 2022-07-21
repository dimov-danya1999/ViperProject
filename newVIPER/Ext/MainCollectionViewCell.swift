//
//  MainCollectionViewCell.swift
//  ViperProjcet
//
//  Created by mac on 15.07.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let reusableIdentifier = "reusableIdentifier"
    
    var model: ServiceModel? {
        didSet {
            imageView.image = model?.image
            myLabel.text = model?.text
        }
    }
    
    let imageView: UIImageView = {
         let imageView = UIImageView()
         imageView.clipsToBounds = true
         imageView.contentMode = .scaleToFill
         return imageView
     }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
      
    }
}
