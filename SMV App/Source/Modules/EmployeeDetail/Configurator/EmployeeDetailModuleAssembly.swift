import UIKit
import Swinject

class EmployeeDetailModuleAssembly: Assembly {
    
    //Module assembly
    func assemble(container: Container) {
        
        container.register(EmployeeDetailInteractorProtocol.self) { (r, presenter: EmployeeDetailPresenterProtocol) in
            let interactor = EmployeeDetailInteractor()
            interactor.presenter = presenter
            interactor.employeeService = r.resolve(EmployeeAPIServiceProtocol.self)
            
            return interactor
        }
        
        container.register(EmployeeDetailRouterProtocol.self) { (r, viewController: EmployeeDetailViewProtocol) in
            let router = EmployeeDetailRouter()
            router.viewController = viewController
            
            return router
        }
        
        container.register(EmployeeDetailPresenterProtocol.self) { (r, viewController: EmployeeDetailViewProtocol) in
            let presenter = EmployeeDetailPresenter()
            presenter.view = viewController
            presenter.interactor = r.resolve(EmployeeDetailInteractorProtocol.self, argument: presenter as EmployeeDetailPresenterProtocol)
            presenter.router = r.resolve(EmployeeDetailRouterProtocol.self, argument: viewController as EmployeeDetailViewProtocol)
            
            return presenter
        }
        
        
        container.register(EmployeeDetailViewProtocol.self) { r in
            let view = EmployeeDetailView()
            view.presenter = r.resolve(EmployeeDetailPresenterProtocol.self, argument: view as EmployeeDetailViewProtocol)
            
            return view
        }
    }
}
