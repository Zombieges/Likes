//
//  Storyboard.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/06.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import UIKit

public enum Storyboard: String {
    case Account
    
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC else { return }
        
        return vc
    }
}
