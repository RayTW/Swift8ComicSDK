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

    open class func indexOf(source : String, search : String) -> Range<String.Index>?{
        return source.range(of: search)
    }
    
    open class func indexOfUpper(source : String, search : String) -> String.Index?{
        let range =  source.range(of: search)
        
        guard range != nil else {
            return nil
        }
        
        return range?.upperBound;
    }
    
    open class func indexOfLower(source : String, search : String) -> String.Index?{
        let range =  source.range(of: search)
        
        guard range != nil else {
            return nil
        }
        
        return range?.lowerBound;
    }
    
    open class func substring(source : String, upper : String.Index, lower : String.Index) -> String{
        let range = upper ..< lower
        
        return source.substring(with: range)
    }
    
    open class func substring(source : String, beginIndex : String.Index) -> String{
        return source.substring(from: beginIndex)
    }
    
}
