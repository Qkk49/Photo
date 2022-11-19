import Foundation

//MARK: - Protocol
protocol InteractorSearchListProtocol: AnyObject {}

final class SearchListInteractor: InteractorSearchListProtocol {
    
    weak var presenter: PresenterSearchListProtocol?
    
}
