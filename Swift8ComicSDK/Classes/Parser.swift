//
//  Parser.swift
//  Pods
//
//  Created by ray.lee on 2017/6/8.
//
//

import Foundation


open class Parser{
    
    public init() {
    }
    
    open func allComics(htmlString : String) -> [Comic]{
        var html : String = htmlString

        let commicIdBegin = "showthumb("
        let commicIdEnd = ",this);"
        var comicIdBeginIndex :String.Index?;
        var comicIdEndIndex :Range<String.Index>?;
        var comicId : String = "";
        
        let commicNameBegin = "hidethumb();'>"
        let commicNameEnd = "</a></td>"
        var comicNameBeginIndex :String.Index?;
        var comicNameEndIndex :Range<String.Index>?;
        var comicName : String = "";
        
        
        var comicAry = [Comic]()
        
        while(true){
            comicIdBeginIndex = StringUtility.indexOfUpper(source: html, search: commicIdBegin)
            comicIdEndIndex = StringUtility.indexOf(source: html, search: commicIdEnd)
            
            if(comicIdBeginIndex == nil || comicIdEndIndex == nil){
                break;
            }
            
            comicId = StringUtility.substring(source: html, upper: comicIdBeginIndex!, lower: comicIdEndIndex!.lowerBound)
            
            html = StringUtility.substring(source: html, beginIndex: comicIdEndIndex!.upperBound)
            comicNameBeginIndex = StringUtility.indexOfUpper(source: html, search: commicNameBegin)
            comicNameEndIndex = StringUtility.indexOf(source: html, search: commicNameEnd)
            
            if(comicNameBeginIndex == nil || comicNameEndIndex == nil){
                break;
            }

            comicName = StringUtility.substring(source: html, upper: comicNameBeginIndex!, lower: comicNameEndIndex!.lowerBound)
            

            let comic = Comic()
            comic.mId = comicId
            comic.mName = comicName
            comicAry.append(comic)
        }

        
        return comicAry;
    }

    
}


