//
//  Protocol.swift
//  FoodCourt
//
//  Created by batuhan on 24.09.2022.
//

import Foundation

protocol ViewToPresenterKayitProtocol{
    var kayitInteractor : PresenterToInteractorKayitProtocol? { get set}
    
    func kaydet()
}
protocol PresenterToInteractorKayitProtocol{
    func kisiKaydet()
}

protocol KayitRouterProtocol{
    static func createModule(ref:KayitVC)
}
