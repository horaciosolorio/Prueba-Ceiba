import Foundation
import UIKit

final class MainBuilder {
    static func build() -> UIViewController? {
        let mainNav = UIStoryboard(
            name: "Main", bundle: .none).instantiateViewController(withIdentifier: "ListInit")
            as? UINavigationController

        guard let view: MainViewProtocol = mainNav?.topViewController as? MainViewController else {
            return nil
        }

        let presenter = MainPresenter()
        let interactor = MainIteractor()
        let router = MainRouter()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        view.presenter = presenter
        interactor.presenter = presenter

        return mainNav
    }

}
