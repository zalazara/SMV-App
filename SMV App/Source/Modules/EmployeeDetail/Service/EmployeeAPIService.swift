import Foundation

public class EmployeeAPIService : EmployeeAPIServiceProtocol {
    
    public var session: URLSession!
    
    init(){
        session = URLSession(configuration: .default)
    }
    
    public func fetchEmployee(id: String, completionHandler:@escaping (Result<EmployeeEntity, Error>) -> ()){
        
        let router = EmployeeServiceRouter()
        router.path.append(id)
        
        NetworkLayer.request(router: router, urlSession: session){ (result: Result<EmployeeEntity, Error>) in
            completionHandler(result)
        }
    }
}

