import UIKit

class EmployeeDetailView: UIViewController, EmployeeDetailViewProtocol {

	var presenter: EmployeeDetailPresenterProtocol?
    
    //MARK: Outlets
    @IBOutlet weak var employeeProfileImage: UIImageView!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeAgeLabel: UILabel!
    @IBOutlet weak var employeeSalaryLabel: UILabel!
    
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onFetchDataButtonAction(_ sender: Any) {
        
        presenter?.fetchEmployeeDetail(id: "1")
        
    }
    
    func setEmployeeData(name: String, age: String, salary: String) {
        employeeNameLabel.text = name
        employeeAgeLabel.text = age
        employeeSalaryLabel.text = salary
    }
}
