//
//  TestParser.swift
//  Swift8ComicSDK
//
//  Created by ray.lee on 2017/6/8.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import Swift8ComicSDK

class TestParser: XCTestCase {
    fileprivate let mParser : Parser = Parser()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testR8ComicGetAll() {
        // This is an example of a functional test case.
        var html = "<table id=\"atoz_rp_namelist_26_dl_26\" cellspacing=\"0\" style=\"width:100%;border-collapse:collapse;\">"
        html += "<tr>"
        html += "<td style=\"width:20%;\"><a href=\"/html/3238.html\" onmouseover='showthumb(3238,this);' onmouseout='hidethumb();'>ZEGAPAIN外傳</a></td><td style=\"width:20%;\"><a href=\"/html/9214.html\" onmouseover='showthumb(9214,this);' onmouseout='hidethumb();'>ZENZEN</a></td><td style=\"width:20%;\"><a href=\"/html/6627.html\" onmouseover='showthumb(6627,this);' onmouseout='hidethumb();'>ZERO</a></td><td style=\"width:20%;\"><a href=\"/html/1151.html\" onmouseover='showthumb(1151,this);' onmouseout='hidethumb();'>Zetman</a></td><td style=\"width:20%;\"><a href=\"/html/1148.html\" onmouseover='showthumb(1148,this);' onmouseout='hidethumb();'>ZigZag帥哥棒球隊</a></td>"
        html += "</tr><tr>"
        html += "<td style=\"width:20%;\"><a href=\"/html/12355.html\" onmouseover='showthumb(12355,this);' onmouseout='hidethumb();'>ZOMBIE</a></td><td style=\"width:20%;\"><a href=\"/html/8874.html\" onmouseover='showthumb(8874,this);' onmouseout='hidethumb();'>砸扁你</a></td><td style=\"width:20%;\"><a href=\"/html/362.html\" onmouseover='showthumb(362,this);' onmouseout='hidethumb();'>雜居時代</a></td><td style=\"width:20%;\"><a href=\"/html/13303.html\" onmouseover='showthumb(13303,this);' onmouseout='hidethumb();'>災難女友</a></td><td style=\"width:20%;\"><a href=\"/html/14610.html\" onmouseover='showthumb(14610,this);' onmouseout='hidethumb();'>災難太過喜歡我</a></td>"
        html += "</tr><tr>"
        let comicAry = mParser.allComics(html, R8Comic.get().getConfig())
        
        XCTAssertNotNil(comicAry, "comicAry == nil")
    }
    
}
