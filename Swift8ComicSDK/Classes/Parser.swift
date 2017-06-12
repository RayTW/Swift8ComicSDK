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
        var comicIdBeginIndex :Int = -1;
        var comicIdEndIndex :Int = -1;
        var comicId : String = "";
        
        let commicNameBegin = "hidethumb();'>"
        let commicNameEnd = "</a></td>"
        var comicNameBeginIndex :Int = -1;
        var comicNameEndIndex :Int = -1;
        var comicName : String = "";
        
        
        var comicAry = [Comic]()
        
        while(true){
            comicIdBeginIndex = StrintUtility.indexOf(source: html, search: commicIdBegin)
            comicIdEndIndex = StrintUtility.indexOf(source: html, search: commicIdEnd)
            
            if(comicIdBeginIndex == -1 || comicIdEndIndex == -1){
                print("end,html=\(html)")
                break;
            }
            
            comicId = StrintUtility.substring(source: html, beginIndex: comicIdBeginIndex + StrintUtility.count(commicIdBegin), endIndex: comicIdEndIndex)
            html = StrintUtility.substring(source: html, beginIndex: comicIdEndIndex + StrintUtility.count(commicIdEnd))
            
            
            comicNameBeginIndex = StrintUtility.indexOf(source: html, search: commicNameBegin)
            comicNameEndIndex = StrintUtility.indexOf(source: html, search: commicNameEnd)
            
            if(comicNameBeginIndex == -1 || comicNameEndIndex == -1){
                print("end,html=\(html)")
                break;
            }
            comicName = StrintUtility.substring(source: html, beginIndex: comicNameBeginIndex + StrintUtility.count(commicNameBegin), endIndex: comicNameEndIndex)
            

            let comic = Comic()
            comic.mId = comicId
            comic.mName = comicName
            comicAry.append(comic)
        }

        
        return comicAry;
    }

  
}


