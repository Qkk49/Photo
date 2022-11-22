import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewSearchListProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func reloadData()
}

class SearchListViewController: UIViewController {

    //MARK: - Property
    var presenter: PresenterSearchListProtocol?
    private var timer: Timer?
    var searchListSearchBar = UISearchBar()
    lazy var searchListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createSearchListLayout())
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

//MARK: - Setup View
extension SearchListViewController: ViewSearchListProtocol {
    func setupView() {
        searchListCollectionView.delegate = self
        searchListCollectionView.dataSource = self
        searchListCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifire)
        
        searchListSearchBar.delegate = self
        searchListSearchBar.placeholder = "Search"
        searchListSearchBar.searchTextField.backgroundColor = .white
        searchListSearchBar.searchTextField.textColor = .black
        
        view.addSubviews(searchListSearchBar, searchListCollectionView)
        addConstraints()
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func reloadData() {
        searchListCollectionView.reloadData()
    }
}

extension SearchListViewController {
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchListSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchListSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchListSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchListCollectionView.topAnchor.constraint(equalTo: searchListSearchBar.bottomAnchor, constant: 10),
            searchListCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchListCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: - Create Layouts
    private func createSearchListLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 2.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 / 2.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(25)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        section.interGroupSpacing = 0

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

//MARK: - CollectionView: DataSource, Delegate
extension SearchListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let searchModels = presenter?.getSearchViewModels() else { return 0 }
        return searchModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchListCollectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifire, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }

        guard let searchModel = presenter?.getSearchViewModels()?[indexPath.row] else { return cell }

        cell.photoImageView.kf.setImage(with: URL(string: searchModel.url))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = presenter?.getSearchViewModels()?[indexPath.row]
        presenter?.searchSelected(using: navigationController!, data: data)
    }
}

//MARK: - Implementation SearchBar
extension SearchListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { [self] _ in
            presenter?.ja(text: searchText)
            searchListCollectionView.reloadData()
        })
    }
}
