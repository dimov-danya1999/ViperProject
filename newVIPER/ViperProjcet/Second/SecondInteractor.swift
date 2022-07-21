//
//  SecondInteractor.swift
//  ViperProjcet
//
//  Created by mac on 13.07.2022.
//  /
//

import Foundation


protocol SecondInteractorInput {
}

protocol SecondInteractorOutput: AnyObject {
}

final class SecondInteractor {
    
    // MARK: - Public Properties
    
    weak var presenter: SecondInteractorOutput?
    
    // MARK: Init
    
    init() {
    }
}

// MARK: - SecondInteractorInput

extension SecondInteractor: SecondInteractorInput {
}
