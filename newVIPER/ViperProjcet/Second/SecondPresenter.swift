//
//  SecondPresenter.swift
//  ViperProjcet
//
//  Created by mac on 13.07.2022.
//  
//

import Foundation

protocol SecondViewOutput: ViewOutput {
}

final class SecondPresenter {
    
    // MARK: - Public Properties
    
    weak var view: SecondViewInput?
    var interactor: SecondInteractorInput?
    var router: SecondRouterInput?
    
    // MARK: - Init
    
    init() {
       
    }
}

// MARK: - SecondViewOutput

extension SecondPresenter: SecondViewOutput {
}

// MARK: - SecondInteractorOutput

extension SecondPresenter: SecondInteractorOutput {
}
