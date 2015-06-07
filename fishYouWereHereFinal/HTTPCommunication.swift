//
//  HTTPCommunication.swift
//  fishYouWereHereFinal
//
//  Created by Gavin Thompson on 2015-06-06.
//  Copyright (c) 2015 Gavin Thompson. All rights reserved.
//

import Foundation

class HTTPCommunication: NSObject, NSURLConnectionDelegate {
    
    lazy var data = NSMutableData()
    
    var currentTemp:Double!
    var currentConditions:String!
    
    func getWeatherData(lat:Double, lng:Double){
        let latString = lat.description
        let lngString = lng.description
        
        var urlString = "http://api.openweathermap.org/data/2.5/weather?units=imperial&lat="
        urlString += latString
        urlString += "&lon="
        urlString += lngString
        
        println(urlString)
        
        var url: NSURL = NSURL(string: urlString)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
        
    }
        
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        
        let jsonWeatherArray = jsonResult["weather"] as! NSArray
        let jsonMainResults = jsonResult["main"] as! NSDictionary
        let jsonWeather = jsonWeatherArray[0] as! NSDictionary
        
        self.currentConditions = jsonWeather["description"] as! String
        self.currentTemp = jsonMainResults["temp"] as! Double


    }
}
