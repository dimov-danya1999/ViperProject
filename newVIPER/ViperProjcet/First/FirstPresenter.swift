//
//  FirstPresenter.swift
//  ViperProjcet
//
//  Created by mac on 12.07.2022.
//  
//

import UIKit

protocol FirstViewOutput: ViewOutput {
    
}

final class FirstPresenter {
    
    // MARK: - Public Properties
    
    weak var view: FirstViewInput?
    var interactor: FirstInteractorInput?
    var router: FirstRouterInput?

    // MARK: - Init
    
    init() {
    }
    
}

// MARK: - FirstViewOutput

extension FirstPresenter: FirstViewOutput {
    
}

// MARK: - FirstInteractorOutput

extension FirstPresenter: FirstInteractorOutput {
}
