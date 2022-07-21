//
//  SecondRouter.swift
//  ViperProjcet
//
//  Created by mac on 13.07.2022.
//  
//

import Foundation
import UIKit

protocol SecondRouterInput {
}

final class SecondRouter {
    
    // MARK: - Public Properties
    
    weak var view: ModuleTransitionHandler?
}

// MARK: - SecondRouterInput

extension SecondRouter: SecondRouterInput {
}
