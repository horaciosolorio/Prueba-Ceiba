import Foundation


final class UserDetailPresenter: UserDetailPresenterProtocol {
    
    
    var interactor: UserDetailInteractorInputProtocol?
    var router: UserDetailRouterProtocol?
    weak var view: UserDetailViewProtocol?

    func backtoUsers() {
        guard let toView = view as? UserDetailViewController else { return }
        router?.backToUsers(from: toView)
    }
    
    func viewDidAppear() {
        interactor?.viewDidAppear()
    }
    
}

extension UserDetailPresenter: UserDetailInteractorOutputProtocol {
    
    func obtainedPosts(posts: [Post]) {
        view?.showPosts(users: posts)
    }
    
    func showEmptyResults() {
        
    }
    
    func showLoading(with message: String) {
        
    }
    
    func showLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func showAlertError(error: String) {
        
    }
    
    func showAlertMessage(title: String, message: String) {
        
    }
    
    
}
