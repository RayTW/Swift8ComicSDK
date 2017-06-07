public class R8Comic{
    private static let mInstance : R8Comic = R8Comic()
    private var mConfig : Config = Config()
    
    init() {
        
    }
    
    public class func get() -> R8Comic{
        return mInstance
    }
    
    func setConfig(config: Config){
        mConfig = config
    }
    
    public func getAll(comics: @escaping ([Comic]) -> Void) -> Void {
        let url = URL(string: mConfig.mAllUrl)
        let request = URLRequest(url: url!)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        print("THIS LINE IS PRINTED")
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let data = data {
                let comicAry = [Comic]()
                
                print("THIS ONE IS PRINTED, TOO")
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    comics(comicAry)
                } else {
                    comics(comicAry)
                }
            }
        })
        task.resume()
        
        
        
    }
}
