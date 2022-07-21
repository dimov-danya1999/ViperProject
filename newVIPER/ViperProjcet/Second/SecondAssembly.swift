//
//  SecondAssembly.swift
//  ViperProjcet
//
//  Created by mac on 13.07.2022.
//  /
//

import UIKit

final class SecondAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        guard let model = model as? Model
            else { fatalError() }
        
        let view = SecondViewController()
        let router = SecondRouter()
        let presenter = SecondPresenter()
        let interactor = SecondInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}

// MARK: - Transition model

extension SecondAssembly {
    
    struct Model: TransitionModel {
        
    }
}

