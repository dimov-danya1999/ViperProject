//
//  CustonView.swift
//  ViperProjcet
//
//  Created by mac on 14.07.2022.
//

import UIKit

protocol CustomViewDelegate: AnyObject {
    func didTap(text: String)
}

class CustomView: UIView  {
    weak var delegate: CustomViewDelegate?
    
   private let myView = UIView()
   private let myLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTap() {
        self.delegate?.didTap(text: myLabel.text ?? "default")
    }
    
    private func setupView() {
        self.addSubview(myView)
        self.myView.addSubview(myLabel)
        myLabel.text = "text"
        
        myView.backgroundColor = .systemGray
        myLabel.backgroundColor = .systemPurple
        myView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        myLabel.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)
        }
    }
}


