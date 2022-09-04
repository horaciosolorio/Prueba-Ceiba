import Foundation
import UIKit

protocol MainInteractorInputProtocol: AnyObject {

    var presenter: (MainPresenterProtocol & MainInteractorOutputProtocol)? {get set}

    func viewDidAppear()
}

protocol MainInteractorOutputProtocol {
    func obtainedUsers(users: [User])
    func showEmptyResults()
}

protocol MainPresenterProtocol: AnyObject {
    func viewDidAppear()
    func goToUserDetail(userId: Int)
}

protocol MainViewProtocol: AnyObject {
    var presenter: (MainPresenterProtocol & MainInteractorOutputProtocol)? {get set}

    func showUsers(users: [User])
    func showEmptyResults()
}

protocol MainRouterProtocol: AnyObject {
    func goToUserDetail(from view: UIViewController, with userId: Int)

}
