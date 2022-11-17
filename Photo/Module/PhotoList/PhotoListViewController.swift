import UIKit
import Kingfisher

class PhotoListViewController: UIViewController {
    
    var presenter: PresenterPhotoListProtocol = PhotoListPresenter(view: nil, router: nil, interactor: nil)
    lazy var photoListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createPhotoListLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.addSubview(photoListCollectionView)
        addConstraints()
    }
    
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            photoListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoListCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoListCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PhotoListViewController {
    //MARK: - Create Layouts
    private func createPhotoListLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.8))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2.0 / 5.0),
            heightDimension: .fractionalHeight(1.0))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = 20
        section.orthogonalScrollingBehavior = .continuous

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension PhotoListViewController: ViewPhotoListProtocol {
    func setupView() {
        photoListCollectionView.delegate = self
        photoListCollectionView.dataSource = self
        photoListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoListCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifire)
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func onFetchPhotoListSucces() {
        photoListCollectionView.reloadData()
    }
    
    func onFetchPhotoListFailure(error: String) {
        print("AaaaaaA")
    }
}

extension PhotoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = photoListCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifire, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        if let imageURL = presenter.getPhotoUrl(for: indexPath.row) {
            cell.photoImageView.kf.setImage(with: URL(string: imageURL))
        }
        return cell
    }
}
