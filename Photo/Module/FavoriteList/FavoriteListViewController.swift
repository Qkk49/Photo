import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewFavoriteListProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func reloadData()
}

class FavoriteListViewController: UIViewController {

    var presenter: PresenterFavoriteListProtocol?
    
    //MARK: - TableView
//    lazy var photoListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createPhotoListLayout())
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

//MARK: - Setup View
extension FavoriteListViewController: ViewFavoriteListProtocol {
    func setupView() {
//        photoListCollectionView.delegate = self
//        photoListCollectionView.dataSource = self
//        photoListCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifire)
//        view.addSubviews(photoListCollectionView)
        addConstraints()
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func reloadData() {
//        photoListCollectionView.reloadData()
    }
}

extension FavoriteListViewController {
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
//            photoListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            photoListCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            photoListCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            photoListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
