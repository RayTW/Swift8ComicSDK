//
//  Comic.swift
//  Pods
//
//  Created by ray.lee on 2017/6/7.
//
//

import Foundation

public class Comic{
    var mId : String? // 漫畫編號
    var mName : String?// 漫畫名稱
    var mAuthor : String?// 漫畫作者
    var mLatestUpdateDateTime : String? //最後更新的時間
    var mDescription : String? //漫畫描述
    var mEpisodes = [Episode]() //漫畫集數列表
}
