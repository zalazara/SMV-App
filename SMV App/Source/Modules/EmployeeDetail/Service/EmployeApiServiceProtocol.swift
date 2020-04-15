import Foundation
import Swinject

protocol EmployeeAPIServiceProtocol: class {
    var session: URLSession! { get set }
    func fetchEmployee(id: String, completionHandler:@escaping (Result<EmployeeEntity, Error>) -> ())
}

class EmployeeAPIServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(EmployeeAPIServiceProtocol.self) { r in
            if CommandLine.arguments.contains("-UITests") {
                return EmployeeAPIServiceMock()
            }
            
            return EmployeeAPIService()
        }
    }
    
}
