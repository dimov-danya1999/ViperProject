//
//  ServiceModel.swift
//  ViperProjcet
//
//  Created by mac on 18.07.2022.
//

import UIKit

struct ServiceModel {
    var image: UIImage?
    var text: String?
}

struct Section {
    let arraySeviceModel: [ServiceModel]
}

struct Model {
   static let shared = [Section(arraySeviceModel: [ServiceModel(image: UIImage(named: "1"), text: "text"),
                                                  ServiceModel(image: UIImage(named: "2"), text: "text"),
                                                   ServiceModel(image: UIImage(named: "3"), text: "text")
                                                  ])]
}
