import Foundation
import UIKit

protocol MainInteractorInputProtocol: class {

    var presenter: (MainPresenterProtocol & MainInteractorOutputProtocol)? {get set}

    func viewDidAppear()
}

protocol MainInteractorOutputProtocol {
    func obtainedUsers(users: [User])
    func showEmptyResults()
}

protocol MainPresenterProtocol: class {
    func viewDidAppear()
    func goToUserDetail(userId: Int)
}

protocol MainViewProtocol: class {
    var presenter: (MainPresenterProtocol & MainInteractorOutputProtocol)? {get set}

    func showUsers(users: [User])
    func showEmptyResults()
}

protocol MainRouterProtocol: class {
    func goToUserDetail(from view: UIViewController, with userId: Int)

}
