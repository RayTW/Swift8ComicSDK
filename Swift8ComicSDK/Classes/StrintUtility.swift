//
//  File.swift
//  Pods
//
//  Created by ray.lee on 2017/6/12.
//
//

import Foundation

open class StrintUtility{
    
    public init() {
    }
    
    open class func count(_ source : String) -> Int{
        return source.characters.count
    }
    
    open class func indexOf(source : String, search : String) -> Int{
        let string = source as NSString
        let range =  string.range(of: search)
        
        if(range.location == NSNotFound){
            return -1
        }
        
        return range.location;
    }
    
    open class func substring(source : String, beginIndex : Int, endIndex : Int) -> String{
        let string = source as NSString
        let range = NSMakeRange(beginIndex, endIndex - beginIndex);
        
        return string.substring(with: range)
    }
    
    open class func substring(source : String, beginIndex : Int) -> String{
        let string = source as NSString
        return string.substring(from: beginIndex)
    }
}
