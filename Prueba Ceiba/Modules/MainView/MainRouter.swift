import Foundation
import UIKit

final class MainRouter: MainRouterProtocol {
    func goToUserDetail(from view: UIViewController, with userId: Int) {
        guard let userDetail =  UserDetailBuilder.build(with: userId) else { return }
        view.show(userDetail, sender: .none)
    }
        
    
    
}
