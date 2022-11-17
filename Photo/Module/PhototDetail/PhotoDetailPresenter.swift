import UIKit

//MARK: - Protocol
protocol PresenterPhotoDetailProtocol: AnyObject {
    func viewDidLoad()
}

final class PhotoDetailPresenter {
    
    weak var view: ViewPhotoDetailProtocol?
    var router: RouterPhotoDetailProtocol?
    var interactor: InteractorPhotoDetailProtocol?
//    var photoViewModels: [PhotoViewModel]?
    
    private let moduleTitle = "Photo"
    
}

extension PhotoDetailPresenter: PresenterPhotoDetailProtocol {
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
}
