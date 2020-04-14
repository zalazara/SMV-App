import Foundation

public class NetworkLayer {
    
    public class func request<T: Codable>(router: NetworkLayerRouter, urlSession: URLSession = URLSession(configuration: .default), completion: @escaping (Result<T, Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method.rawValue
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                debugPrint(error!)
                return
            }
            guard response != nil else {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch let error {
                debugPrint(error)
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}
