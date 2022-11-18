import UIKit

//MARK: - Protocol
protocol PresenterPhotoDetailProtocol: AnyObject {
    init(data: PhotoComplete?)
    func getPhotoComplete() -> PhotoComplete?
    func viewDidLoad()
}

final class PhotoDetailPresenter {
    
    weak var view: ViewPhotoDetailProtocol?
    var router: RouterPhotoDetailProtocol?
    var interactor: InteractorPhotoDetailProtocol?
    var data: PhotoComplete?
    
    required init(data: PhotoComplete?) {
        self.data = data
    }
    
    private let moduleTitle = "Photo"
    
}

extension PhotoDetailPresenter: PresenterPhotoDetailProtocol {
    
    func getPhotoComplete() -> PhotoComplete? {
        return data
    }
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
}
