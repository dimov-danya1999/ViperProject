//
//  ViewOutput.swift
//  ViperProjcet
//
//  Created by mac on 12.07.2022.
//

import UIKit

protocol ViewOutput: AnyObject {
    
    // Optional
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDeinit()
    func viewWillChangeOrientation(to orientation: UIDeviceOrientation)
    func viewDidChangeOrientation(to orientation: UIDeviceOrientation)
}

extension ViewOutput {
    
    // Default implementation
    func viewDidLoad() { }
    func viewWillAppear() { }
    func viewDidAppear() { }
    func viewWillDisappear() { }
    func viewDeinit() { }
    func viewWillChangeOrientation(to orientation: UIDeviceOrientation) { }
    func viewDidChangeOrientation(to orientation: UIDeviceOrientation) { }
}
