//
//  DetayRouter.swift
//  FoodCourt
//
//  Created by batuhan on 14.09.2022.
//

import Foundation

class DetayRouter : PresenterToRouter{
    static func createModule(ref: DetayVC) {
        ref.DetayPresenterDelegate = DetayPresenter()
        ref.DetayPresenterDelegate?.detayInteractor = DetayInteractor()
    }
    
    
}
