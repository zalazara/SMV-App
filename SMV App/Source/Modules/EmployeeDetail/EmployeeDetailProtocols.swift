import Foundation

protocol EmployeeDetailRouterProtocol: class {
    
}

protocol EmployeeDetailPresenterProtocol: class {
    func fetchEmployeeDetail(id: String)
    func onFetchEmployeeDetailSuccess(employee: EmployeeEntity)
    func onFetchEmployeeDetailFailure(error: Error)
}


protocol EmployeeDetailInteractorProtocol: class {
    
    var presenter: EmployeeDetailPresenterProtocol?  { get set }
    func fetchEmployeeDetail(id: String)
}


protocol EmployeeDetailViewProtocol: class {
    
    var presenter: EmployeeDetailPresenterProtocol?  { get set }
    func setEmployeeData(name: String, age: String, salary: String)
}
