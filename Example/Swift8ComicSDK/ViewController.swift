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
    private var mComics : [Comic]?
    private var mHostMap : [String : String]?
    
    
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
        
        let comics : [Comic] = R8Comic.get().getParser().allComics(html, R8Comic.get().getConfig())
        
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
            print("comic,EpisodeCount=>\(comic.getEpisode().count)")
        }
    }
    
    @IBAction func loadEpisodeDetail(_ sender: Any) {
        let episode = R8Comic.get().generatorFakeEpisode("http://v.comicbus.com/online/comic-103.html?ch=1")
        
        R8Comic.get().loadEpisodeDetail(episode) { (Episode) in
            print("episode=>\(episode)")
        }
    }
    
    @IBAction func completeTest(_ sender: Any) {
        doCompleteTest("103")
        //        substringTest()
    }
    
    @IBAction func searchTest(_ sender: Any) {
//        testSearchComic(keyword: "中")
//        testSearchComic(keyword: "1")
        print("searchTest")
        testSearchComic(keyword: "食戟")
    }
    
    @IBAction func quickSearchTest(_ sender: Any) {
        testQuickSearchComic(keyword: "中")
        testQuickSearchComic(keyword: "1")
    }
    
    func substringTest() -> Void {
        let str : String = "'csi1i83i16whpb47f9a2nnr3jfmpy3sj44rkx7pnyk2mymyr7rcsi2i83i12rru4b5ecpkkw9j8k7veu86uxta9tkn8unykx75c3csi3i83i11vb45t53ydghg4wg46ad2cc2k2jxvjnw8h8w49chdcsi4i84si7h9uxy32q8mc7vgg8tnebbfrwqcn7sx7wx29es4vccsi5i84si8r38ntnhj6y77jydvdgtjwy7c2vt2ejspawbq84nwcsi6i83i12ra6jkdjrt2ee3kqdct95qf3ch9a3r47aausyjp7rcsi7i84i10kvy4bb2vx4hrrtt52wh6dq8hvxs9k7mn2wsfte8fcsi8i84i12vch5w2xt7n9hwc2erbnx6gk9y6r2rmb8pmxyxs8kcsi9i83i14fjc35vte3jaf72jseykpfdp5da24x35nxturg6rssi10i83si8gwvx853sqfqgwcsc2s5av58nvwx7rgre8w49en6usi11i84i104bat7v7x6wf3u4bs7ycmmeeh4s3upt7y3872rarasi12i85i12qdusc48q6vqf452pewk7nsv4cs7er8f68qk6ffy3si13i85i10crvwbha6387k7mvbvf62vfbujqsywgnwbpekb7cvsi14i85i10kb4ksh8vx38s94m3957revve99qfuw2sftaa8p4qsi15i85si8n9pdkacattua53hh5uc5w45k4whjdhpdw66acdtbsi16i85i10mfpb84ccbx2dgpv577gfucf5rqca5ww3ej8r9us6si17i82i10j2fduwjvcgnb52d92cbcyw6cxxbu9mhwfeu74gj8si18i82i147x6dyrx6wgna594bfa8wrqc4hvv9xq64vxb8xhmesi19i82si8fakgw2ke9k6he24hbabj6852s9tsk2ta5tk45gjtsi20i82i102snetbtun6nmpsgbdbnf37vfmm74exdmbmpj33x4si21i85i12787uxqnx889hh3fecqpu87kk23by5jww55ywr4f7si22i82i10rptcehsysbr7jww46bbpyy4qqfqb38we3adyp54nsi23i82i12ksyne3c5j9a764e5jksygnx34rtm2vuj28gmd7uxsi24i82i10n64r8dqjch4qesuupptjnc5bs3vgmfq2d6dvmnwmsi25i82i10td79tg8gbk6ssfbuvyb3772xs2x7rg4d4nq2yc8p8000i82si8yvssude57vatd96jth9sw4g6r9q53dcwxp9fuuw98001i83i109wa7q723yk8n65dcdsjecrgn754p7qsxc9qkbtpw8002i83i12d24grw5r8metaq4mm2juec8f7n65qmrq89nxp9tr8003i82si6hhaejar9j8t4ve7pujjykjm7whjkr6dngu27j3kq8004i82si6jgce76v5mhdr83eu7kdnytfa8bs3sc7kqvn3q773"
        
        print("\(StringUtility.substring(str, 50, 54))")
    }
    
    @IBAction func showComicEpisodeList(_ sender: Any) {
        //讀取漫畫存放的伺服器host
        R8Comic.get().loadSiteUrlList { (hostMap : [String : String]) in
            self.mHostMap = hostMap
            
            let comic = R8Comic.get().generatorFakeComic("104", name: "xxx")

            
            
            print("comic,id==>\(comic.getId()), name[\(comic.getName())]")
            print("comic,封面大圖==>\(String(describing: comic.getIconUrl())), 封面小圖[\(String(describing: comic.getSmallIconUrl()))]")
            
            //單1本漫畫，解析說明、集數等等資料…
            R8Comic.get().loadComicDetail(comic, onLoadDetail: { (comic) in
                
                
                print("comic,集數==>\(comic.getEpisode().count)")
                
                for episode : Episode  in comic.getEpisode() {
                    print("name[(\(episode.getName())]")
                }
            })
        }
    }
    func doCompleteTest(_ comicId : String!) -> Void {
        //讀取漫畫存放的伺服器host
        R8Comic.get().loadSiteUrlList { (hostMap : [String : String]) in
            self.mHostMap = hostMap
            
            //取得全部漫畫
            R8Comic.get().getAll { (comics:[Comic]) in
                self.mComics = comics
                var oneComic : Comic? = nil
                
                for comicTemp : Comic  in comics {
                    print("id==>\(comicTemp.getId()), name[\(comicTemp.getName())]")
                    
                    if(comicTemp.getId() == comicId) {
                        oneComic = comicTemp
                        break
                    }
                }
                
                let comic = oneComic!
                
                
                print("comic,id==>\(comic.getId()), name[\(comic.getName())]")
                print("comic,封面大圖==>\(String(describing: comic.getIconUrl())), 封面小圖[\(String(describing: comic.getSmallIconUrl()))]")
                
                //單1本漫畫，解析說明、集數等等資料…
                R8Comic.get().loadComicDetail(comic, onLoadDetail: { (comic) in
                    
                    
                    print("comic,集數==>\(comic.getEpisode().count)")
                    //單集漫畫讀取圖片網址資料
                    let episode = comic.getEpisode()[0]
                    //檢查此漫畫集數是否已有串過完整url，若未有完成url則將url重組
                    if(!episode.getUrl().hasPrefix("http")){
                        episode.setUrl(hostMap[episode.getCatid()]! + episode.getUrl())
                    }
                    
                    
                    print("comic,episode,ch==>\(episode)")
                    print("comic,episode,url==>\(episode.getUrl())")
                    
                    
                    R8Comic.get().loadEpisodeDetail(episode, onLoadDetail: { (episode) in
                        print("comic,episode,ch==>\(episode)")
                        
                        episode.setUpPages()
                        
                        print("episode,單集多張圖片網址=>\(episode.getImageUrlList())")
                        
                    })
                })
            }
        }
    }
    
    func testSearchComic(keyword : String){
        R8Comic.get().searchComic(keyword) { (comics) in
            print("searchComic=>\(comics.count)")
            
            for comicTemp : Comic  in comics {
                print("id==>\(comicTemp.getId()), name[\(comicTemp.getName()), smallIconUrl[\(String(describing: comicTemp.getSmallIconUrl()))]")
            }
            
        }
    }
    
    func testQuickSearchComic(keyword : String){
        R8Comic.get().quickSearchComic(keyword) { (comics) in
            print("testQuickSearchComic=>\(comics.count)")
            
            for comicTemp : String  in comics {
                print("name[\(comicTemp)]")
            }
        }
    }
}

