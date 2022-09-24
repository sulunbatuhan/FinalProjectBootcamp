//
//  DetayVC.swift
//  FoodCourt
//
//  Created by batuhan on 13.09.2022.
//

import UIKit
import Kingfisher

class DetayVC: UIViewController {
    
    @IBOutlet weak var detayImage: UIImageView!
    @IBOutlet weak var detayName: UILabel!
    @IBOutlet weak var detayPrice: UILabel!
    
    @IBOutlet weak var adetlbl: UILabel!
    let kullanici_Adi = "batuhan"
    
    var DetayPresenterDelegate : ViewToPresenterDetayProcotol?
    
    
    var detay : Yemekler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adetlbl.text = "0"
        if let yemek = detay {
            detayName.text = yemek.yemek_adi
            detayPrice.text = "\(yemek.yemek_fiyat!)₺"
            
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
                
                DispatchQueue.main.async {
                    self.detayImage.kf.setImage(with: url)
                }
            }
            
        }
        
        
        DetayRouter.createModule(ref: self)
        self.ViewDesign()
        
    }

    
    @IBAction func AdetArttır(_ sender: UIStepper) {
        sender.maximumValue = 10
        sender.minimumValue = 0
        adetlbl.text = String(Int(sender.value))
    }
    
    // MARK: - Navigation
    
    @IBAction func SepeteEkle(_ sender: UIButton) {
        if let yemek = detay{
            let adet = Int(adetlbl.text!)
            if adet! > 0 {
                DetayPresenterDelegate?.ekle(yemek_adi: yemek.yemek_adi!, yemek_resim_adi: yemek.yemek_resim_adi!, yemek_fiyat: Int(yemek.yemek_fiyat!)!, yemek_siparis_adet: adet! , kullanici_adi: kullanici_Adi)
                navigationController?.popViewController(animated: true)
            }else if adet == 0{
                let alert = UIAlertController(title: "Hata", message: "Lütfen adet seçiniz", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Tamam", style: .destructive)
                alert.addAction(ok)
                present(alert, animated: true)
                
            }
            
           
            
        }
        
        
    }
    
    
}
