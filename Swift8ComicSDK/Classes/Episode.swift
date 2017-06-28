//
//  Episode.swift
//  Pods
//
//  Created by ray.lee on 2017/6/7.
//
//

import Foundation

open class Episode{
    fileprivate var mName : String?// 漫畫每集(話)(卷)名稱
    
    open func getName() -> String{
        return mName!
    }
    
    open func setName(_ name : String) -> Void{
        mName = name
    }
}
