//
//  AnasayfaInteractor.swift
//  FoodCourt
//
//  Created by batuhan on 14.09.2022.
//

import Foundation
import Alamofire



class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol{
    var anasayfapresenter: InteractToPresenAnasayfaTasiyiciProtokol?
    
  
    
    func tumYemekleriGetir() {
     AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get ).response{
            response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler{
                        
                        self.anasayfapresenter?.presenterVeriGonder(YemekList: liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
    
    
    
    func yemekAra(keyword: String) {
        let params  : Parameters = ["yemek_adi":keyword]
      
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .post,parameters: params).response{
            response in
            
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler{
                        
                      
                        self.anasayfapresenter?.presenterVeriGonder(YemekList: liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
        }
        
    }
    
}
