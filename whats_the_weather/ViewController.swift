//
//  ViewController.swift
//  whats_the_weather
//
//  Created by Griff Hall on 12/2/14.
//  Copyright (c) 2014 Griffappolis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var city: UITextField!
    
    
    @IBOutlet weak var message: UILabel!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
              //takes spaces out, ex San Francisco
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        
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

