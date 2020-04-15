import UIKit

class EmployeeDetailInteractor: EmployeeDetailInteractorProtocol {

    weak var presenter: EmployeeDetailPresenterProtocol?
    var employeeService: EmployeeAPIServiceProtocol?
    
    func fetchEmployeeDetail(id: String) {
        employeeService?.fetchEmployee(id: id) { (result: Result<EmployeeEntity, Error>) in
            switch result {
                
            case .success(let employee):
                self.presenter?.onFetchEmployeeDetailSuccess(employee: employee)
            case .failure(let error):
                self.presenter?.onFetchEmployeeDetailFailure(error: error)
            }
        }
    }
}
