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
    fileprivate var mUrl : String?
    fileprivate var mCatid : String?
    fileprivate var mCopyright : String?
    fileprivate var mCh : String?
    fileprivate var mChs : Int = 0
    fileprivate var mTi : Int = 0
    fileprivate var mCs : Int = 0
    
    open func getName() -> String{
        return mName!
    }
    
    open func setName(_ name : String) -> Void{
        mName = name
    }
    
    open func getUrl() -> String{
        return mUrl!
    }
    
    open func setUrl(_ url : String) -> Void{
        mUrl = url
    }
    
    open func getCatid() -> String{
        return mCatid!
    }
    
    open func setCatid(_ catid : String) -> Void{
        mCatid = catid
    }
    
    open func getCopyright() -> String{
        return mCopyright!
    }
    
    open func setCopyright(_ copyright : String) -> Void{
        mCopyright = copyright
    }
    
    open func getCh() -> String{
        return mCh!
    }
    
    open func setCh(_ ch : String) -> Void{
        mCh = ch
    }
    
    open func getChs() -> Int{
        return mChs
    }
    
    open func setChs(_ chs : Int) -> Void{
        mChs = chs
    }
    
    open func getTi() -> Int{
        return mTi
    }
    
    open func setTi(_ ti : Int) -> Void{
        mTi = ti
    }
    
    open func getCs() -> Int{
        return mCs
    }
    
    open func setCs(_ cs : Int) -> Void{
        mCs = cs
    }
}
