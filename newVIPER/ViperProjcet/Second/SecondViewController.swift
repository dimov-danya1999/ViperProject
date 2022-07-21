//
//  SecondViewController.swift
//  ViperProjcet
//
//  Created by mac on 13.07.2022.
//  
//

import UIKit
import SnapKit

protocol SecondViewInput: AnyObject {
}

class SecondViewController: UIViewController {
    
    weak var delegateSecond: LabelProtocolDelegate?
    
    private lazy var label1: UILabel = {
        let label = UILabel()
        label.text = ""
        label.tintColor = .systemPurple
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy  var label2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.tintColor = .systemPurple
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var label3: UILabel = {
        let label = UILabel()
        label.text = ""
        label.tintColor = .systemPurple
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy  var textField1: UITextField = {
        let textFiield = UITextField()
        textFiield.placeholder = "введи первый город"
        return textFiield
    }()
    
    private lazy  var textField2: UITextField = {
        let textFiield = UITextField()
        textFiield.placeholder = "введи второй город"
        return textFiield
    }()
    
    private lazy var textField3: UITextField = {
        let textFiield = UITextField()
        textFiield.placeholder = "введи третий город"
        return textFiield
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("нажми", for: .normal)
        button.backgroundColor = .green
        button.tintColor = .brown
        button.addTarget(self, action: #selector(didTupButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Public Properties
    
    var presenter: SecondViewOutput?

     // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraint()
        //delegateVS2?.label(label1: textField1.text!, label2: textField2.text!, label3: textField3.text!)
    }
    

    @objc func didTupButton() {
        delegateSecond?.nameDelegate()
        label1.text = textField1.text
        label2.text = textField2.text
        label3.text = textField3.text
    }
    
    func addConstraint() {
        Helper.tamicOff(view: [label1,label2,label3,textField1,textField2,textField3])
        let stack = UIStackView(view: [label1,textField1], axis: .vertical, spacing: 20)
        view.addSubview(stack)
        
        let stack2 = UIStackView(view: [label2,textField2], axis: .vertical, spacing: 20)
        view.addSubview(stack2)
        
        let stack3 = UIStackView(view: [label3,textField3], axis: .vertical, spacing: 20)
        view.addSubview(stack3)
        
        stack.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.top.equalTo(150)
        }
        
        stack2.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.top.equalTo(stack.snp.bottom).offset(150)
        }
        
        stack3.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.top.equalTo(stack2.snp.bottom).offset(150)
        }
        
        view.addSubview(myButton)
        myButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(45)
            make.left.equalTo(110)
            make.top.equalTo(stack3.snp.bottom).offset(60)
        }
    }
}

// MARK: - SecondViewInput

extension SecondViewController: SecondViewInput {
    
}
