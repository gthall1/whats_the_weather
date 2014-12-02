//
//  ViewController.swift
//  whats_the_weather
//
//  Created by Griff Hall on 12/2/14.
//  Copyright (c) 2014 Griffappolis. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet weak var city: UITextField!
    
    
    @IBOutlet weak var message: UILabel!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.view.endEditing(true)
        //hides keyboard
        
        var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
              //takes spaces out, ex San Francisco
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            let tempurlContent: String = urlContent as String
            
            if (urlContent!.containsString("<span class=\"phrase\">")) {
            
                var contentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
                
                var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
                
                var weatherForcast = newContentArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º") as String
                
                dispatch_async(dispatch_get_main_queue()) {
                
                    self.message.text = weatherForcast
                    
                }
            
            } else {
            
                dispatch_async(dispatch_get_main_queue()) {
                
                    self.message.text = "Couldn't find city - please try again"
                    
                }
            
            }
            
        
        }
        
        task.resume()
        //prints html to the console
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

