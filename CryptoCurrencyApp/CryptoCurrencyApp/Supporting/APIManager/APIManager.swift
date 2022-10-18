import Alamofire

struct APIManager {
    static let instance = APIManager()
    
    enum Constants {
        static let baseURL = "https://rest.coinapi.io/v1"
    }
    
    enum EndPoints {
        static let assets = "/assets"
    }
    
    let header: HTTPHeaders = [
        "X-CoinAPI-Key": "40B1547A-45D8-43D0-98EB-D54EC9036994",
        "Accept": "applecation/json"
    ]
    
    func getAllAssets(completion: @escaping(([CurrencyClientModel]) -> Void)) {
            AF.request(Constants.baseURL + EndPoints.assets,
                       method: .get,
                       parameters: [:],
                       headers: header).responseDecodable(of:[CurrencyServerModel].self) { response in
                switch response.result {
                case .success(let data):
                    let convertedModels = data.map(CurrencyModelConverter.instance.convert)
                    completion(convertedModels)
                case .failure(let error): print(error)
                        }
                    }
                }
        private init() { }
}
