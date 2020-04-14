import Foundation

struct EmployeeEntity: Codable {
    var id: String
    var employee_name: String
    var employee_salary: String
    var employee_age: String
    var profile_image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case employee_name
        case employee_salary
        case employee_age
        case profile_image
    }
    
    enum DataKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: DataKeys.self)
        let dataInfo = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        id = try dataInfo.decode(String.self, forKey: .id)
        employee_name = try dataInfo.decode(String.self, forKey: .employee_name)
        employee_salary = try dataInfo.decode(String.self, forKey: .employee_salary)
        employee_age = try dataInfo.decode(String.self, forKey: .employee_age)
        profile_image = try dataInfo.decode(String.self, forKey: .profile_image)
    }
}
