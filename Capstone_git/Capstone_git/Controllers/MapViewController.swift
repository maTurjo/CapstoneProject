//
//  MapViewController.swift
//
//
//  Created by Mubassir Ahmed Turjo on 3/10/22.
//

import CoreLocation
import UIKit
import MapKit

struct RestaurantLocation:Identifiable,Decodable{
    var id=UUID()
    let latitude:Double
    let longitude:Double
    
    private enum CodingKeys:CodingKey{
        case latitude
        case longitude
    }
}

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    private var restaurantAnnotation = [RestaurantLocation]()
    
    @IBOutlet weak var myloc: MKMapView!
    
    let manager=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Map Scene"
        loadLocations()
        // Do any additional setup after loading the view.
        
        
    }
    
    //view dud apprear once map shows up to register vlaues for GPS location services
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myloc.delegate=self
        manager.delegate=self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization();
        manager.startUpdatingLocation();
    }
    
    
    
    //Loading saved Restaurant locations
    func loadLocations(){
        
        guard let path=Bundle.main.path(forResource: "RestaurantsLocation", ofType: "json")else{
            fatalError("File Location not found")
            
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return}
        
        let annotations = try? JSONDecoder().decode([RestaurantLocation].self,from: data)
        if let annotations=annotations{
            self.restaurantAnnotation=annotations
        }
        
    }
    
    //location manager captures current lcoation and calls render function to display location

        func locationManager(_ manager:CLLocationManager,didUpdateLocations location:[CLLocation]){
            loadLocations()
            if let location=location.first{
                manager.startUpdatingLocation()
                render(location)
            }
        }
    
    func render(_ location:CLLocation){
        
            let annotation=MKPointAnnotation();
            annotation.title="Home"
        annotation.subtitle="You are here"
          
        
          //let coordinate=CLLocationCoordinate2D(latitude:location.coordinate.latitude,longitude:location.coordinate.longitude)

        
            annotation.coordinate=CLLocationCoordinate2D(latitude:location.coordinate.latitude,longitude:location.coordinate.longitude)
        
        let span=MKCoordinateSpan(latitudeDelta:0.1,longitudeDelta:0.1)

        let region=MKCoordinateRegion(center:annotation.coordinate,span:span)

          myloc.setRegion(region,animated:true )
        myloc.addAnnotation(annotation)
        
        for item in restaurantAnnotation{
            let resAnnotation=MKPointAnnotation();
            resAnnotation.coordinate=CLLocationCoordinate2D(latitude:item.latitude,longitude:item.longitude)
            myloc.addAnnotation(resAnnotation)
        }
      }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        if(annotation.title=="Home"){
        
           annotationView.markerTintColor = UIColor.blue
            //annotationView.image=UIImage(named: "home")
        }
        
        return annotationView
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
