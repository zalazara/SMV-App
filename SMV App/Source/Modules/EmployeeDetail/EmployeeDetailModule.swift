import UIKit

class EmployeeDetailModule {

    static func build() -> UIViewController {        
        let view = EmployeeDetailView()
        let interactor = EmployeeDetailInteractor()
        let router = EmployeeDetailRouter()
        let presenter = EmployeeDetailPresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
