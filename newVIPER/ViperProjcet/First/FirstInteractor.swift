//
//  FirstInteractor.swift
//  ViperProjcet
//
//  Created by mac on 12.07.2022.
//  /
//

import UIKit


protocol FirstInteractorInput {
}

protocol FirstInteractorOutput: AnyObject {
}

final class FirstInteractor {
    
    // MARK: - Public Properties
    
    weak var presenter: FirstInteractorOutput?
    
    // MARK: Init
    
    init() {
    }
}

// MARK: - FirstInteractorInput

extension FirstInteractor: FirstInteractorInput {
}
