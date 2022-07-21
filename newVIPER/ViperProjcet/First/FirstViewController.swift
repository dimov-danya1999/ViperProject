//
//  FirstViewController.swift
//  ViperProjcet
//
//  Created by mac on 12.07.2022.
//  
//

import SnapKit
import UIKit

protocol FirstViewInput: AnyObject {
    
}

protocol LabelProtocolDelegate: AnyObject {
    func nameDelegate()
}

class FirstViewController: UIViewController {
    
    let storoge = Model.shared
   
    weak var delegate1: LabelProtocolDelegate?
    
    private lazy var collection: UICollectionView = {
        let loyaou = UICollectionViewFlowLayout()
        loyaou.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: loyaou)
        collection.backgroundColor = .systemBlue
        collection.delegate = self
        collection.dataSource = self
        collection.register(MainCollectionViewCell.self,
                            forCellWithReuseIdentifier: MainCollectionViewCell.reusableIdentifier)
        return collection
    }()
    
    // MARK: - Public Properties
    
    var presenter: FirstViewOutput?

     // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collection)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collection.frame = view.bounds
    }
}

// MARK: - FirstViewInput

extension FirstViewController: FirstViewInput {
    
}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, LabelProtocolDelegate {
    
    func nameDelegate() {
        let vc = SecondViewController()
        vc.delegateSecond = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storoge[0].arraySeviceModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reusableIdentifier, for: indexPath) as? MainCollectionViewCell else {
            fatalError()
        }
        cell.model = storoge[0].arraySeviceModel[indexPath.item]
        //cell.imageView.image = UIImage(named: customImages[indexPath.row].imageName ?? "default")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width / 2) - 2,
                      height: (view.frame.size.width / 2) - 2)
    }
}
    
    
    
