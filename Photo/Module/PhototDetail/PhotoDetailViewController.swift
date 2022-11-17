import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewPhotoDetailProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func reloadData()
}

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PhotoDetailViewController: ViewPhotoDetailProtocol {
    
    func setupView() {
        
    }
    
    func setTitle(with title: String) {
        
    }
    
    func reloadData() {
        
    }
}
