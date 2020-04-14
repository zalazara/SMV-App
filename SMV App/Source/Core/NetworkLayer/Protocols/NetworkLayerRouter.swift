import Foundation

public protocol NetworkLayerRouter{
    var scheme: String { get set }
    var host: String { get set }
    var path: String { get set }
    var method: NetworkLayerHTTPMethod { get set }
    var parameters: [URLQueryItem]? { get set}
}
