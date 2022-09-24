//
//  SiparisVC.swift
//  FoodCourt
//
//  Created by batuhan on 22.09.2022.
//

import UIKit
import MapKit
import CoreLocation
class SiparisVC: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var mapKit: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(konumSec(gestureRecognizer:)))
        longPress.minimumPressDuration = 3
        mapKit.addGestureRecognizer(longPress)
    }
    
    @objc func konumSec(gestureRecognizer : UILongPressGestureRecognizer){
        if gestureRecognizer.state  == .began{
            let dokunulanNokta = gestureRecognizer.location(in: mapKit)
            let dokunulanKoordinat = mapKit.convert(dokunulanNokta,toCoordinateFrom: mapKit)
            let pin = MKPointAnnotation()
            pin.coordinate = dokunulanKoordinat
            pin.title = "Komşuma gelsin"
           
            mapKit.addAnnotation(pin)
            
        }
        
    }
    func locationSettings(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
