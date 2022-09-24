//
//  ViewController.swift
//  FoodCourt
//
//  Created by batuhan on 12.09.2022.
//

import UIKit
import Alamofire
import Kingfisher
import UserNotifications


class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var food = [Yemekler]()
    var filterFood = [Yemekler]()
    var izinKontrol = false
    
   
    var AnasayfaPresenterDelegate : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    
        self.searchBar.isTranslucent = true
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        
       
        yemekleriGetirCollection()
       
        AnasayfaRouter.createModule(ref: self)
        AnasayfaPresenterDelegate?.yemekleriGetir()
        self.ViewDesign()
       
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) {
            granted , error in
            self.izinKontrol = granted
            
            UNUserNotificationCenter.current().delegate = self
            
        }
        
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(imageGestureRecognizer(gestureRecognizer: )))
        imageGesture.numberOfTapsRequired = 1
        imageView.isUserInteractionEnabled = true
        
        imageView.addGestureRecognizer(imageGesture)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     self.collectionView.reloadData()
        
        
    }
    
    
    
    @IBAction func iconBell(_ sender: UIBarButtonItem) {
        //sepet.count çekilecek badge sayısına atılacak
     notification()

            
        }
    
    @objc func imageGestureRecognizer(gestureRecognizer : UITapGestureRecognizer){
       performSegue(withIdentifier: "burgerKing", sender: nil)
    }
    
    func notification(){
        if izinKontrol {
            
            let icerik  = UNMutableNotificationContent()
            icerik.title = "Food Court"
            icerik.body = "Sepette bekleyen ürünleriniz var"
            
            icerik.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let bildirimistek = UNNotificationRequest(identifier: "id", content: icerik, trigger: trigger)
            UNUserNotificationCenter.current().add(bildirimistek)
            
            
        }
    }
    
    func yemekleriGetirCollection(){
         let tasarim = UICollectionViewFlowLayout()
         tasarim.sectionInset = UIEdgeInsets(top: 0 , left: 0, bottom: 0, right: 0)
         tasarim.minimumInteritemSpacing = 5
         tasarim.minimumLineSpacing = 5
         
         let genislik = UIScreen.main.bounds.width
         let itemGenislik = (genislik)/4
         tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.5)
       
         collectionView.collectionViewLayout = tasarim
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetay"{
            if let yemek = sender as? Yemekler{
                let destinationVC = segue.destination as! DetayVC
                destinationVC.detay = yemek
            }
        }
        
    }
            
            
   

}

extension AnasayfaVC : PresenterToViewAnasayfaTasiyiciProtocol{
    func viewVeriGonder(YemekList: Array<Yemekler>) {
        self.food = YemekList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
       
    }
    
    
}

extension AnasayfaVC : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return food.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let rows = food[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hucre", for: indexPath) as! AnasayfaCell
     
        cell.lblad.text = rows.yemek_adi
        //cell.lblPrice.text = "\(rows.yemek_fiyat!)₺"
       
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(rows.yemek_resim_adi!)"){
            
            DispatchQueue.main.async {
                cell.imageView.kf.setImage(with: url)
            }
        }
        cell.selectedBackgroundView?.backgroundColor = UIColor.systemGray6
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rows = food[indexPath.row]
        performSegue(withIdentifier: "ToDetay", sender: rows)
        
    }
     
}


extension AnasayfaVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110 , height: 170)
    }
}


extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //    AnasayfaPresenterDelegate?.Ara(keyword: searchText)
      
        
    }
    
}




extension AnasayfaVC : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        
        app.applicationIconBadgeNumber = 5
        completionHandler()
    }
    
   
}
