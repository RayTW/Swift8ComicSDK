open class R8Comic{
    fileprivate static let sInstance : R8Comic = R8Comic()
    fileprivate var mConfig : Config = Config()
    fileprivate let mParser : Parser = Parser()
    
    init() {
        
    }
    
    open class func get() -> R8Comic{
        return sInstance
    }
    
    func setConfig(_ config: Config){
        mConfig = config
    }
    
    open func getAll(_ comics: @escaping ([Comic]) -> Void) -> Void {
        let url = URL(string: mConfig.mAllUrl)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let data = data {
                
                let string = StringUtility.dataToStringBig5(data: data)
                let comicAry = self.mParser.allComics(htmlString: string)
                
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    comics(comicAry)
                } else {
                    print("getAll fail")
                }
            }
        })
        task.resume()
    }
    
    open func loadComicDetail(_ comic: Comic, onLoadDetail: @escaping (Comic) -> Void) -> Void{
        let url = URL(string: mConfig.getComicDetailUrl(comic.getId()))
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let data = data {
                
                let string = StringUtility.dataToStringBig5(data: data)
                
                let comicDetail = self.mParser.comicDetail(htmlString: string, comic: comic)
                
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                   onLoadDetail(comicDetail)
                } else {
                    print("loadComicDetail fail")
                }
            }
        })
        task.resume()
    }
    
    open func getParser() -> Parser{
        return self.mParser;
    }
    
    open func getConfig() -> Config{
        return self.mConfig;
    }
    
    open func generatorFakeComic(_ id : String, name : String) -> Comic{
        let comic = Comic()
        comic.setId(id)
        comic.setName(name)
        return comic
    }
}
