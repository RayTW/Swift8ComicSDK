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
            comic.setId(comicId)
            comic.setName(comicName)
            comicAry.append(comic)
        }

        
        return comicAry;
    }

    open func comicDetail(htmlString : String, comic : Comic) -> Comic{
        let html : [String] = htmlString.components(separatedBy: "\n")
        
        
        var tmpch = ""
        let findCview = "cview("
        let findDeaitlTag = "style=\"line-height:25px\">"
        var findCviewRange :Range<String.Index>?
        var findDetailTagRange :Range<String.Index>?;
        let authorTag = "作者：</td>"
        var findAuthorRange :Range<String.Index>?
        let updateTag = "更新：</td>"
        var latestUpdateTimeRange :Range<String.Index>?
        
        for txt in html {
            findCviewRange = StringUtility.indexOf(source: txt, search: findCview)
            
            //解析集數
            if(findCviewRange != nil){
                
                
            }else{
                //解析漫畫簡介
                if(comic.getDescription() == nil){
                    findDetailTagRange = StringUtility.indexOf(source: txt, search: findDeaitlTag)
                    
                    if(findDetailTagRange != nil){
                        let lower = StringUtility.indexOfLower(source: txt, search: "</td>")
                        comic.setDescription(StringUtility.substring(source: txt, upper: (findDetailTagRange?.upperBound)!, lower: lower!))
                    }
                }
                //解析作者
                if(comic.getAuthor() == nil){
                    if(findAuthorRange == nil){
                        findAuthorRange = StringUtility.indexOf(source: txt, search: authorTag)
                        
                        if(findAuthorRange != nil){
                            continue
                        }
                    }
                    if(findAuthorRange != nil){
                        comic.setAuthor(self.replaceTag(txt))
                    }
                } else if(comic.getLatestUpdateDateTime() == nil){
                    //解析最新更新日期
                    if(latestUpdateTimeRange == nil){
                        latestUpdateTimeRange = StringUtility.indexOf(source: txt, search: updateTag)
                        
                        if(latestUpdateTimeRange != nil){
                            continue
                        }
                    }
                    if(latestUpdateTimeRange != nil){
                        comic.setLatestUpdateDateTime(self.replaceTag(txt))
                    }
                }
            }
        }
        
        return comic;
    }
    
    open func replaceTag(_ txt : String) -> String{
        var ret = ""
        let st = "<"
        let ed = ">"
        let charAry = txt.characters
        var check = false
        
        for c in charAry {
            if(c == st.characters.first){
                check = true
            }else if(c == ed.characters.first){
                check = false
                continue
            }
            if(check){
                continue
            }
            if(c == "\r" || c == "\n"){
                continue
            }
            ret.append(c)
        }
        
        return ret
    }
    
    open func removeScriptsTag(_ st : String) -> String{
        var ret = st
        let beginStr = "<script>"
        let endStr = "</script>"
        let lower : String.Index? = StringUtility.indexOfLower(source: st, search: beginStr)
        let upper : String.Index? = StringUtility.indexOfUpper(source: st, search: endStr)
        
        if(upper != nil && lower != nil){
            ret = st.substring(to: lower!) + st.substring(from: upper!)
        }
        
        return ret
    }
}


