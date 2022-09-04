import Foundation
import UIKit

protocol UserDetailInteractorInputProtocol: class {
    var presenter: (UserDetailPresenterProtocol & UserDetailInteractorOutputProtocol)? {get set}
    
    func viewDidAppear()
    
}

protocol UserDetailInteractorOutputProtocol: LoaderControlProtocol, AlertProtocol  {
    func obtainedPosts(posts: [Post])
    func showEmptyResults()
    
    
}

protocol UserDetailPresenterProtocol: class {
    func backtoUsers()
    func viewDidAppear()
}

protocol UserDetailViewProtocol: class, LoaderControlProtocol, AlertProtocol  {
    var presenter: (UserDetailPresenterProtocol & UserDetailInteractorOutputProtocol)? {get set}
    
    func showPosts(users: [Post])
    func showEmptyResults()
    
}

protocol UserDetailRouterProtocol: class {
    
    func backToUsers(from view: UIViewController)
    
}
