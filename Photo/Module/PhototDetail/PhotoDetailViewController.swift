import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewPhotoDetailProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func reloadData()
}

class PhotoDetailViewController: UIViewController {
    
    var presenter: PresenterPhotoDetailProtocol?
    
    //MARK: - Property
    var photoDetailImageView = UIImageView(frame: .zero)
    var nameDetailLabel = UILabel()
    var dataDetailLabel = UILabel()
    var favoriteDetailButton = UIButton()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(ph)
        presenter?.viewDidLoad()
        
    }
}

extension PhotoDetailViewController: ViewPhotoDetailProtocol {
    
    func setupView() {
        addConstraints()
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func reloadData() {
        
    }
}

extension PhotoDetailViewController {
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
//            .topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            .leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            .trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            .bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
