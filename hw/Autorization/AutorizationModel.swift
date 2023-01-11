//
//  AutorizationModel.swift
//  UISegmentControl
//
//  Created by Shamil Ashurilov on 10.01.2023.
//

import Foundation
import UIKit

final class AutorizationModel {
    static var theme = UIColor.white
}

extension AutorizationModel: LoginProtocol {
    var login: String {
        Autorization.loginUser1()[0]
    }
    
    var password: String {
        Autorization.loginUser1()[1]
    }
}
