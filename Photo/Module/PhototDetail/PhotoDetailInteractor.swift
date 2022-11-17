import Foundation

//MARK: - Protocol
protocol InteractorPhotoDetailProtocol: AnyObject {
    
}

final class PhotoDetailInteractor: InteractorPhotoDetailProtocol {
    
    weak var presenter: PresenterPhotoListProtocol?
    
}
