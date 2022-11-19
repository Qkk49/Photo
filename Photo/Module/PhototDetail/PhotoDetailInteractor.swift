import Foundation
import CoreData

//MARK: - Protocol
protocol InteractorPhotoDetailProtocol: AnyObject {
    init(data: PhotoComplete?)
    var dataDetail: DataPhotoDetail { get set }
    var favorite: FavoritePhoto? { get set }
    func saveFavorite()
}

final class PhotoDetailInteractor: InteractorPhotoDetailProtocol {
    
    weak var presenter: PresenterPhotoDetailProtocol?
    var data: PhotoComplete?
    
    lazy var dataDetail: DataPhotoDetail = DataPhotoDetail(date: PhotoDetailInteractor.formatDate(from: data!.date), url: data!.url, name: data?.name)
    
    required init(data: PhotoComplete?) {
        self.data = data
    }
    
    var favorite: FavoritePhoto?
    
    func saveFavorite() {
        if favorite == nil {
            favorite = FavoritePhoto()
        }
        
        if let favorite = favorite {
            favorite.favDate = dataDetail.date
            favorite.favURL = dataDetail.url
            favorite.favName = dataDetail.name
            CoreDataManager.instance.saveContext()
            self.favorite = nil
        }
    }
    
}
