import Foundation
import Swinject

final class ApplicationAssembly {
    
    //Use default dependency
    class var assembler: Assembler {
        return Assembler([
            EmployeeAPIServiceAssembly(),
            EmployeeDetailModuleAssembly()
        ])
    }
    
    var assembler: Assembler
    
    //If you want use custom Assembler
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
    
}
