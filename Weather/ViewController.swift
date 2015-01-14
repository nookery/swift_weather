//
//  ViewController.swift
//  Weather
//
//  Created by Andy on 14/11/5.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tv:UITextView?
    
    @IBAction func btnPressed(sender:AnyObject){
//        println("button clicked");
        loadWeather()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWeather(){
        var url = NSURL(string: "http://www.weather.com.cn/data/sk/101010100.html")
        var data: NSData = NSData.self.init(contentsOfURL: url!)!
        
        var str = NSString(data:data, encoding:NSUTF8StringEncoding)
        
        var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
        var weatherInfo: AnyObject? = json.objectForKey("weatherinfo")
        var temp:AnyObject? = weatherInfo?.objectForKey("temp")
        var wind: AnyObject? = weatherInfo?.objectForKey("WD")
        var city: AnyObject? = weatherInfo?.objectForKey("city")
        
        tv?.text = "温度：\(temp!)\n风：\(wind!)\n"
    }


}

