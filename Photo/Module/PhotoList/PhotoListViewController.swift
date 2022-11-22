import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewPhotoListProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func reloadData()
}

class PhotoListViewController: UIViewController {
    
    var presenter: PresenterPhotoListProtocol?
    
    //MARK: - CollectionView
    lazy var photoListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createPhotoListLayout())
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

//MARK: - Setup View
extension PhotoListViewController: ViewPhotoListProtocol {
    func setupView() {
        photoListCollectionView.delegate = self
        photoListCollectionView.dataSource = self
        photoListCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifire)
        view.addSubviews(photoListCollectionView)
        addConstraints()
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func reloadData() {
        photoListCollectionView.reloadData()
    }
}

//MARK: - CollectionView: DataSource, Delegate
extension PhotoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let photoModels = presenter?.getPhotoViewModels() else { return 0 }
        return photoModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = photoListCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifire, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        guard let photoModel = presenter?.getPhotoViewModels()?[indexPath.row] else { return cell }
        
        cell.photoImageView.kf.setImage(with: URL(string: photoModel.url))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = presenter?.getPhotoViewModels()?[indexPath.row]
        presenter?.photoSelected(using: navigationController!, data: data)
    }
}

extension PhotoListViewController {
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            photoListCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            photoListCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoListCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoListCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    //MARK: - Create Layouts
    private func createPhotoListLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 2.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 / 2.7))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(25)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        section.interGroupSpacing = 0

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
