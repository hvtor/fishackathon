//
//  MapAnnotation.swift
//  fishYouWereHereFinal
//
//  Created by Gavin Thompson on 2015-06-06.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import Foundation
import MapKit

class MapAnnotation:NSObject, MKAnnotation {
    
    let coordinate:CLLocationCoordinate2D
    let title:String
//    let subtitle:String
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }

}
