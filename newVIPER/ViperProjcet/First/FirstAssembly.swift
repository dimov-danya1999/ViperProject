//
//  FirstAssembly.swift
//  ViperProjcet
//
//  Created by mac on 12.07.2022.
//  /
//

import UIKit

final class FirstAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {

        let view = FirstViewController()
        let router = FirstRouter()
        let presenter = FirstPresenter()
        let interactor = FirstInteractor()
        
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

extension FirstAssembly {
    
    struct Model: TransitionModel {
    }
}
