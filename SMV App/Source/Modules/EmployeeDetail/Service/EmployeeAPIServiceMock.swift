import Foundation
import Mocker

public class EmployeeAPIServiceMock : EmployeeAPIServiceProtocol {
    
    public var session: URLSession!
    
    init(){
        registerMocks()
        configureSession()
    }

    //MARK: Register Mock
    private func registerMocks() {
        let successJSON: URL = Bundle.main.url(forResource: "GetEmployeeSuccess", withExtension: "json")!
        
        guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employee/1") else { return }
        guard let data = try? Data(contentsOf: successJSON) else { return }
        let mock = Mock(url: url, contentType: .json, statusCode: 200, data: [.get : data ])
        Mocker.register(mock)
    }
    
    private func configureSession() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        session = URLSession(configuration: configuration)
    }
    
    public func fetchEmployee(id: String, completionHandler:@escaping (Result<EmployeeEntity, Error>) -> ()){
        
        let router = EmployeeServiceRouter()
        router.path.append(id)
        
        NetworkLayer.request(router: router, urlSession: session){ (result: Result<EmployeeEntity, Error>) in
            completionHandler(result)
        }
    }
}
