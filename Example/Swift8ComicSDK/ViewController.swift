//
//  ViewController.swift
//  Swift8ComicSDK
//
//  Created by RayTW on 06/07/2017.
//  Copyright (c) 2017 RayTW. All rights reserved.
//

import UIKit
import Swift8ComicSDK

class ViewController: UIViewController {
    fileprivate var mComics : [Comic]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadAllComic(_ sender: Any) {
        R8Comic.get().getAll { (comics:[Comic]) in
            self.mComics = comics
            for comic : Comic  in comics {
                print("id==>\(comic.getId()), name[\(comic.getName())]")
            }
        }
    }
    
    @IBAction func getAllTest(_ sender: Any) {
        let html = "<tr><td style=\"width:20%;\"><a href=\"/html/12461.html\" onmouseover='showthumb(12461,this);' onmouseout='hidethumb();'>豬排咖喱飯的日子</a></td><td style=\"width:20%;\"><a href=\"/html/14489.html\" onmouseover='showthumb(14489,this);' onmouseout='hidethumb();'>豬人居然是鎮主夫什麼的</a></td><td style=\"width:20%;\"><a href=\"/html/4227.html\" onmouseover='showthumb(4227,this);' onmouseout='hidethumb();'>竹刀少女</a></td><td style=\"width:20%;\"><a href=\"/html/9889.html\" onmouseover='showthumb(9889,this);' onmouseout='hidethumb();'>竹刀少女C</a></td><td style=\"width:20%;\"><a href=\"/html/6533.html\" onmouseover='showthumb(6533,this);' onmouseout='hidethumb();'>竹劍少年</a></td></tr><tr><td style=\"width:20%;\"><a href=\"/html/13115.html\" onmouseover='showthumb(13115,this);' onmouseout='hidethumb();'>竹林之花，不眠之姬</a></td><td style=\"width:20%;\"><a href=\"/html/13304.html\" onmouseover='showthumb(13304,this);' onmouseout='hidethumb();'>竹馬未完成</a></td><td style=\"width:20%;\"><a href=\"/html/12128.html\" onmouseover='showthumb(12128,this);' onmouseout='hidethumb();'>主從百合本</a></td><td style=\"width:20%;\"><a href=\"/html/5748.html\" onmouseover='showthumb(5748,this);' onmouseout='hidethumb();'>主將!地院家若美</a></td><td style=\"width:20%;\"><a href=\"/html/3713.html\" onmouseover='showthumb(3713,this);' onmouseout='hidethumb();'>主教D</a></td></tr><tr>"
        
        let comics : [Comic] = R8Comic.get().getParser().allComics(htmlString: html)
        
        for comic : Comic  in comics {
            print("id==>\(comic.getId()), name[\(comic.getName())]")
        }
    }
   
    @IBAction func loadComicDetail(_ sender: Any) {
        print("loadComicDetail")

        let comic = R8Comic.get().generatorFakeComic("103", name: "海賊王")
        
        R8Comic.get().loadComicDetail(comic) { (comicDetail : Comic) in
            print("loadFinish,id==>\(comicDetail.getId()), name[\(comicDetail.getName())]")
            
            print("comic,Description=>\(comic.getDescription()!)")
            print("comic,Author=>\(comic.getAuthor()!)")
            print("comic,UpdateTime=>\(comic.getLatestUpdateDateTime()!)")
        }
    }
    @IBAction func loadEpisodeDetail(_ sender: Any) {
        let episode = R8Comic.get().generatorFakeEpisode("http://v.comicbus.com/online/comic-103.html?ch=1")
        
        R8Comic.get().loadEpisodeDetail(episode) { (Episode) in
            print("episode,getChs=>\(episode.getChs())")
        }
    }
}

