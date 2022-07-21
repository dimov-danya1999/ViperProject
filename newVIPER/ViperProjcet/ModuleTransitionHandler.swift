//
//  ModuleTransitionHandler.swift
//  ViperProjcet
//
//  Created by mac on 12.07.2022.
//

import UIKit

protocol ModuleTransitionHandler where Self: UIViewController {
    
}

extension ModuleTransitionHandler {

    @available(iOS 13.0, *)
    func presentAutomatic<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        let modalPresentationStyle: UIModalPresentationStyle = .automatic
        view.modalPresentationStyle = modalPresentationStyle
        present(view, animated: true, completion: nil)
    }
    
    func present<ModuleType: Assembly>(animated: Bool = true,
                                       with model: TransitionModel,
                                       openModuleType: ModuleType.Type,
                                       modalPresentationCapturesStatusBarAppearance: Bool = false,
                                       modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                                       completion: (() -> Void)? = nil) {
        let view = ModuleType.assembleModule(with: model)
        view.modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance
        view.modalPresentationStyle = modalPresentationStyle
        present(view, animated: animated, completion: completion)
    }
    
    func presentModal<ModuleType: Assembly>(with model: TransitionModel,
                                            openModuleType: ModuleType.Type,
                                            modalPresentationCapturesStatusBarAppearance: Bool = false,
                                            modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        let view = ModuleType.assembleModule(with: model)
        let nc = UINavigationController(rootViewController: view)
        nc.modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance
        nc.modalPresentationStyle = modalPresentationStyle
        
        if let view = view as? UIAdaptivePresentationControllerDelegate, #available(iOS 13.0, *), modalPresentationStyle == .formSheet {
            nc.presentationController?.delegate = view
            nc.isModalInPresentation = true
        } else if let transitioningDelegate = self as? UIViewControllerTransitioningDelegate {
            nc.transitioningDelegate = transitioningDelegate
        }
        
        present(nc, animated: true, completion: nil)
    }
    
    func presentModal<ModuleType: Assembly>(openModuleType: ModuleType.Type,
                                            modalPresentationCapturesStatusBarAppearance: Bool = false,
                                            modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        let view = ModuleType.assembleModule()
        let nc = UINavigationController(rootViewController: view)
        nc.modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance
        nc.modalPresentationStyle = modalPresentationStyle
        
        if let view = view as? UIAdaptivePresentationControllerDelegate, #available(iOS 13.0, *), modalPresentationStyle == .formSheet {
            nc.presentationController?.delegate = view
            nc.isModalInPresentation = true
        } else if let transitioningDelegate = self as? UIViewControllerTransitioningDelegate {
            nc.transitioningDelegate = transitioningDelegate
        }
        
        present(nc, animated: true, completion: nil)
    }
    
    func present<ModuleType: Assembly>(moduleType: ModuleType.Type,
                                       modalPresentationCapturesStatusBarAppearance: Bool = false,
                                       modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                                       completion: (() -> Void)? = nil) {
        let view = ModuleType.assembleModule()
        view.modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance
        view.modalPresentationStyle = modalPresentationStyle
        present(view, animated: true, completion: completion)
    }
    
    func show<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType) {
        let view = ModuleType.assembleModule(with: model)
        show(view, sender: nil)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func popToRootViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.navigationController?.popToRootViewController(animated: animated)
        
        if animated, let coordinator = self.transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion?()
            }
        } else {
            completion?()
        }
    }
    
    func push<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type, animated: Bool = true, completion: (() -> Void)? = nil) {
        let view = ModuleType.assembleModule(with: model)
        view.setupConstantBackButton()
        navigationController?.pushViewController(view, animated: animated)
        
        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }
        
        coordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
    
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type, animated: Bool = true, completion: (() -> Void)? = nil) {
        let view = ModuleType.assembleModule()
        view.setupConstantBackButton()
        navigationController?.pushViewController(view, animated: animated)
        
        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }
        
        coordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
    
    func closeModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }
    
    
    // MARK: - Customizing Back button
    
    private func setupConstantBackButton() {
        
        guard navigationItem.backBarButtonItem?.title != "Назад" else { return }
        setBackBarButtonItemTitle("Назад")
    }
    
    func validateBackButtonTextWith(titleOfNextViewController: String?) {
        
        setupConstantBackButton()
        
        //        guard let text = title, let titleOfNextViewController = titleOfNextViewController else { return }
        //
        //        let totalTitle = text + titleOfNextViewController
        //        let width = totalTitle.width(usingFont: Font.navigationItemTitle)
        //
        //        if width > InterfaceUtils.screenWidth / 1.74 {
        //            setupBackButtonText("Назад")
        //        }
        
    }
    
    func validateBackButtonTextWith(titleOfNextViewController: String?, topItemTitle: String?) {
        
        setupConstantBackButton()
        
        //        guard let text = topItemTitle, let titleOfNextViewController = titleOfNextViewController else { return }
        //
        //        let totalTitle = text + titleOfNextViewController
        //        let width = totalTitle.width(usingFont: Font.navigationItemTitle)
        //
        //        if width > InterfaceUtils.screenWidth / 1.74 {
        //            setupBackButtonText("Назад")
        //        }
        
    }
    
    func setupBackButtonText() {
        setupConstantBackButton()
        //        setBackBarButtonItemTitle(title)
    }
    
    func setupBackButtonText(_ title: String) {
        self.setBackBarButtonItemTitle(title)
    }
    
    func setupPreviousBackButtonText() {
        setupConstantBackButton()
        //        setBackBarButtonItemTitle(title)
    }
    
    private func setBackBarButtonItemTitle(_ title: String?) {
        
        let item = UIBarButtonItem(title: title, style: .plain,
                                   target: self, action: #selector(popModule))
        navigationItem.backBarButtonItem = item
    }
    
}

protocol TransitionModel { }

extension UIViewController: ModuleTransitionHandler {
    
    @objc func popModule() {
        navigationController?.popViewController(animated: true)
    }
}

