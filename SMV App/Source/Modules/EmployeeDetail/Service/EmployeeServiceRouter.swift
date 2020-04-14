import Foundation

class EmployeeServiceRouter: NetworkLayerRouter {
    var scheme: String = "http"
    var host: String = "dummy.restapiexample.com"
    var path: String = "/api/v1/employee/"
    var method: NetworkLayerHTTPMethod = .get
    var parameters: [URLQueryItem]?
}
