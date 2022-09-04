
import Foundation
import UIKit

final class UserDetailBuilder {
    static func build(with userId: Int) -> UIViewController? {
    
        guard let view = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController else { return nil }
        
        let presenter = UserDetailPresenter()
        let interactor = UserDetailIteractor()
        let router = UserDetailRouter()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.userId = userId
        
        return view
    }
    
}
