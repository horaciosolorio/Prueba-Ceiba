import Foundation

final class MainPresenter: MainPresenterProtocol {
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?
    weak var view: MainViewProtocol?
    func viewDidAppear() {
        interactor?.viewDidAppear()
    }

    func goToUserDetail(userId: Int) {
        guard let toView = view as? MainViewController else { return }
        router?.goToUserDetail(from: toView, with: userId)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    func obtainedUsers(users: [User]) {
        view?.showUsers(users: users)
    }

    func showEmptyResults() {
    }
}
