import Foundation
import UIKit

final class UserDetailRouter: UserDetailRouterProtocol {
    
    
    func backToUsers(from view: UIViewController) {
        guard let nav = view.navigationController else { return }
        nav.popViewController(animated: true)
    }
    
    

    
    
}
