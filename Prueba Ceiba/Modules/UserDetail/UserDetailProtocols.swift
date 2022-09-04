import Foundation
import UIKit

protocol UserDetailInteractorInputProtocol: AnyObject {
    var presenter: (UserDetailPresenterProtocol & UserDetailInteractorOutputProtocol)? {get set}
    func viewDidAppear()
}

protocol UserDetailInteractorOutputProtocol: LoaderControlProtocol, AlertProtocol {
    func obtainedPosts(posts: [Post])
    func showEmptyResults()
}

protocol UserDetailPresenterProtocol: AnyObject {
    func backtoUsers()
    func viewDidAppear()
}

protocol UserDetailViewProtocol: AnyObject, LoaderControlProtocol, AlertProtocol {
    var presenter: (UserDetailPresenterProtocol & UserDetailInteractorOutputProtocol)? {get set}
    func showPosts(users: [Post])
    func showEmptyResults()
}

protocol UserDetailRouterProtocol: AnyObject {
    func backToUsers(from view: UIViewController)
}
