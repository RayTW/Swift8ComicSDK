//
//  File.swift
//  Pods
//
//  Created by ray.lee on 2017/6/12.
//
//

import Foundation

open class StringUtility{
    
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
    
    open class func substring(source : String, upperString : String, lowerString : String ) -> String?{
        let upper : String.Index? = indexOfUpper(source: source, search: upperString)
        let lower : String.Index? = indexOfLower(source: source, search: lowerString)
        
        if(upper != nil && lower != nil){
            let range = upper! ..< lower!
            
            return source.substring(with: range)
        }
        
        return nil
    }
    
    open class func substring(source : String, beginIndex : String.Index) -> String{
        return source.substring(from: beginIndex)
    }
    
    open class func dataToStringBig5(data : Data) -> String{
        let encodeBig5 = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.big5_HKSCS_1999.rawValue))
        let string = NSString.init(data: data, encoding: encodeBig5)
        
        return string! as String;
    }
    
    open class func split(_ source : String, separatedBy : String) -> [String]{
        return source.components(separatedBy: separatedBy)
    }
    
    open class func trim(_ source : String) -> String{
        return source.trimmingCharacters(in: .whitespaces)
    }
}