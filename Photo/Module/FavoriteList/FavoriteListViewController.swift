import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewFavoriteListProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
//    func reloadData()
}

class FavoriteListViewController: UIViewController {

    var presenter: PresenterFavoriteListProtocol?
    
    //MARK: - TableView
    lazy var favoriteListTableView = UITableView(frame: .zero)
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.performed()
//        favoriteListTableView.reloadData()
    }
}

//MARK: - Setup View
extension FavoriteListViewController: ViewFavoriteListProtocol {
    func setupView() {
        favoriteListTableView.delegate = self
        favoriteListTableView.dataSource = self
        favoriteListTableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        view.addSubviews(favoriteListTableView)
        addConstraints()
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
//    func reloadData() {
//        favoriteListTableView.reloadData()
//    }
}

extension FavoriteListViewController {
    //MARK: - Constraints
    private func addConstraints() {
        NSLayoutConstraint.activate([
            favoriteListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoriteListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favoriteListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FavoriteListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let sections = presenter?.fetchResultController.sections {
//            return sections[section].numberOfObjects
//        } else {
//            return 0
//        }
        return presenter?.numb(number: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoriteListTableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as? FavoriteTableViewCell else { return UITableViewCell() }
        let user = presenter?.getObject(indexPath: indexPath) as? FavoritePhoto
        cell.favoriteNameLabel.text = user?.favName
        cell.favoriteImageView.kf.setImage(with: URL(string: (user?.favURL)!))
        cell.favoriteDateLabel.text = user?.favDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            let photo = presenter?.fetchResultController.object(at: indexPath) as? FavoritePhoto ?? FavoritePhoto()
//            CoreDataManager.instance.context.delete(photo)
//            CoreDataManager.instance.saveContext()
//            favoriteListTableView.reloadData()
        }
    }
}
