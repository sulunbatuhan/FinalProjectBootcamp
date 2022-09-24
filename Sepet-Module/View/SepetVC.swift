//
//  SepetVC.swift
//  FoodCourt
//
//  Created by batuhan on 13.09.2022.
//

import UIKit
import Kingfisher

class SepetVC: UIViewController {

    @IBOutlet weak var SepetTableView: UITableView!
    @IBOutlet weak var lblToplam: UILabel!
    
    
    var sepetDelagete : ViewToPresenterSepetProtocol?
    var sepetList = [SepetYemekler]()
    var sepet = [SepetYemekler]()
    var toplam = 0
    
    let kullanici_Adi = "batuhan"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        SepetTableView.delegate = self
        SepetTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)
        self.ViewDesign()
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetDelagete?.getir(kullanici_adi: kullanici_Adi)
        SepetTableView.reloadData()
    }
 
    @IBAction func siparisiTamamla(_ sender: UIButton) {
       
    }
    
}


// MARK: - Extension Protocol

extension SepetVC : PresenterToViewSepetProtocol{
    
    func vieweVeriGonder(yemekListesi: Array<SepetYemekler>) {
        self.sepetList = yemekListesi
            
     
                    DispatchQueue.main.async {
                self.SepetTableView.reloadData()
                
                self.sepetList.forEach { yemek in
                    self.toplam = self.toplam + (Int(yemek.yemek_fiyat ?? "0")! * Int(yemek.yemek_siparis_adet ?? "0")!)
                }
                self.lblToplam.text = "\(self.toplam) ₺"
                        
            }
        
    }
    
    
}

// MARK: - Extension TableView Delegate
    
extension SepetVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = sepetList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetCell", for: indexPath) as! SepetCell
        cell.sepetAdet.text =  rows.yemek_adi
        cell.sepetlbl.text = rows.yemek_siparis_adet
        cell.hucreFiyat.text = "\(rows.yemek_fiyat)₺"
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(rows.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.sepetImage.kf.setImage(with: url)}
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let rows = self.sepetList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Sepetten Sil") { contextualAction, view, boolDeger in
            self.sepetDelagete?.listesil(kullanici_adi: self.kullanici_Adi, sepet_yemek_id: Int(rows.sepet_yemek_id)!)
            self.sepetList.forEach { yemek in
                self.toplam = self.toplam - (Int(yemek.yemek_fiyat ?? "0")! * Int(yemek.yemek_siparis_adet ?? "0")!)
            }
            tableView.reloadData()
      }
        
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}


    
    
