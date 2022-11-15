import UIKit

class PhotoListPresenter: ViewToPresenterPhotoListProtocol {
    
    var photos = [RandomPhoto]()
    
    weak var view: PresenterToViewPhotoListProtocol?
    var interactor: PresenterToInteractorPhotoListProtocol?
    var router: PresenterToRouterPhotoListProtocol?
    
    func viewDidLoad() {
        view?.showActivity()
        interactor?.fetchPhotoList()
    }
    
    func refresh() {
//        implement as per usage
    }
    
    func numberOfRowsInSection() -> Int {
        return photos.count
    }
    
    func setCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
//        return cell
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.getPhotoDetailAt(index: index)
    }
    
    func tableViewCellHeight() -> CGFloat {
//        hight
    }
}

extension PhotoListPresenter: InteractorToPresenterPhotoListProtocol {
    
    func fetchPhotoListSucces(photos: [RandomPhoto]) {
        self.photos = photos
        view?.hideActivity()
        view?.onFetchPhotoListSucces()
    }
    
    func fetchPhotoListFailure(error: String) {
        view?.hideActivity()
        view?.onFetchPhotoListFailure(error: "Fetch photos error with error code-\(error)")
    }
    
    // Photo detail screen navigation after selecting photos:
    
    func getPhotoDetailSucces(_ detail: PhotoDetail) {
        // Navigate only if you receive the detail object from interactor:
        // use if-let syntax here:
        router?.pushToPhotoDetail(on: view, with: detail)
    }
    
    func getPhotoDetailFailure() {
        view?.hideActivity()
        // Show an alert here:
        print("Photo detail failure")
    }
}
