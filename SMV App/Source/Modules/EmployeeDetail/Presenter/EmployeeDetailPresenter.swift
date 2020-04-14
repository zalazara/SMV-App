import UIKit

class EmployeeDetailPresenter: EmployeeDetailPresenterProtocol {

    weak var view: EmployeeDetailViewProtocol?
    var interactor: EmployeeDetailInteractorProtocol?
    var router: EmployeeDetailRouterProtocol?
    
    func fetchEmployeeDetail(id: String) {
        interactor?.fetchEmployeeDetail(id: id)
    }
    
    func onFetchEmployeeDetailSuccess(employee: EmployeeEntity) {
        view?.setEmployeeData(name: employee.employee_name, age: employee.employee_age, salary: employee.employee_salary)
    }
    
    func onFetchEmployeeDetailFailure(error: Error) {
        
    }
}
