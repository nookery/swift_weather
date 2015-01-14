// Playground - noun: a place where people can play

import Cocoa

//load weather
var url = NSURL(string: "http://www.weather.com.cn/data/sk/101010100.html")
var data: NSData = NSData.self.init(contentsOfURL: url!)!

var str = NSString(data:data, encoding:NSUTF8StringEncoding)

var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
var weatherInfo: AnyObject? = json.objectForKey("weatherinfo")
var temp:AnyObject? = weatherInfo?.objectForKey("temp")
var wind: AnyObject? = weatherInfo?.objectForKey("WD")
var city: AnyObject? = weatherInfo?.objectForKey("city")
