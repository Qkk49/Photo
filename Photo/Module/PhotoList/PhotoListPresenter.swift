import UIKit

final class PhotoListPresenter {
    
    private weak var view: ViewPhotoListProtocol?
    private var router: RouterPhotoListProtocol?
    private var interactor: InteractorPhotoListProtocol?
    private var photos: [RandomPhoto]?
    
    init(view: ViewPhotoListProtocol?, router: RouterPhotoListProtocol?, interactor: InteractorPhotoListProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension PhotoListPresenter: PresenterPhotoListProtocol {
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: "Home")
        fetchPhotoListSucces()
    }
    
    func getPhotoUrl(for indexpath : Int) -> String? {
        return photos?[indexpath].urls.small
    }
    
    func fetchPhotoListSucces() {
        photos = interactor?.photos //TUT
    }
    
    func fetchPhotoListFailure() {
        view?.onFetchPhotoListFailure(error: "Fetch photos error with error code")
    }
}
