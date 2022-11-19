import UIKit

//MARK: - Protocol
protocol PresenterSearchListProtocol: AnyObject {
    func viewDidLoad()
//    func getPhotoViewModels() -> [PhotoComplete]?
//    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?)
//    func fetchPhotoListSucces(photoList: [RandomPhoto])
//    func fetchPhotoListFailure(with errorMessage: Error)
}

final class SearchListPresenter {
    
    weak var view: ViewSearchListProtocol?
    var router: RouterSearchListProtocol?
    var interactor: InteractorSearchListProtocol?
    
    private let moduleTitle = "Search"
    
}

extension SearchListPresenter: PresenterSearchListProtocol {
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
}
