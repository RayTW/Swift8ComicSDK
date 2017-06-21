open class R8Comic{
    fileprivate static let mInstance : R8Comic = R8Comic()
    fileprivate var mConfig : Config = Config()
    fileprivate let mParser : Parser = Parser()
    
    init() {
        
    }
    
    open class func get() -> R8Comic{
        return mInstance
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
                let encodeBig5 = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.big5_HKSCS_1999.rawValue))
                let string = NSString.init(data: data, encoding: encodeBig5)
                
                
                let comicAry = self.mParser.allComics(htmlString: string! as String)
                
                
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    comics(comicAry)
                } else {
                    comics(comicAry)
                }
            }
        })
        task.resume()
        
        
        
    }
    
    open func getParser() -> Parser{
        return self.mParser;
    }
    
}
