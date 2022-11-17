import Foundation

//MARK: - Protocol
protocol TabBarPresenterProtocol: AnyObject {
    func viewLoaded()
}

final class TabBarPresenter {
    
    private weak var view: TabBarViewProtocol?
    private weak var router: TabBarRouterProtocol?
    
    init(view: TabBarViewProtocol?, router: TabBarRouterProtocol?) {
        self.view = view
        self.router = router
    }
}

// MARK: - Interface Setup
extension TabBarPresenter: TabBarPresenterProtocol {
    
    func viewLoaded() {
        view?.setupView()
    }
}
