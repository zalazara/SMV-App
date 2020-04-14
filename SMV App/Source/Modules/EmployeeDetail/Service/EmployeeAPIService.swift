import Foundation


class EmployeeAPIService {
    
    init(){}
    
    public func fetchEmployee(id: String, completionHandler:@escaping (Result<EmployeeEntity, Error>) -> ()){
        
        let router = EmployeeServiceRouter()
        router.path.append(id)
        
        NetworkLayer.request(router: router){ (result: Result<EmployeeEntity, Error>) in
            completionHandler(result)
        }
    }
}
