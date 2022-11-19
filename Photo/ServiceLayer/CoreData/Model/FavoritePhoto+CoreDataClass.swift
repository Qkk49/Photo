import Foundation
import CoreData

@objc(FavoritePhoto)
public class FavoritePhoto: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "FavoritePhoto"), insertInto: CoreDataManager.instance.context)
    }
}
