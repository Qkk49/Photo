import UIKit
import Kingfisher

//MARK: - Protocol
protocol ViewFavoriteListProtocol: AnyObject {
    func setupView()
    func setTitle(with title: String)
    
    var favoriteListTableView: UITableView { get set }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numb(number: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoriteListTableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as? FavoriteTableViewCell else { return UITableViewCell() }
        let photo = presenter?.getObject(indexPath: indexPath) as? FavoritePhoto
        cell.favoriteNameLabel.text = photo?.favName
        cell.favoriteImageView.kf.setImage(with: URL(string: (photo?.favURL)!))
        cell.favoriteDateLabel.text = photo?.favDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let photo = presenter?.getObject(indexPath: indexPath) as? FavoritePhoto ?? FavoritePhoto()
            CoreDataManager.instance.context.delete(photo)
            CoreDataManager.instance.saveContext()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = presenter?.getObject(indexPath: indexPath) as? FavoritePhoto
        let dat: PhotoComplete = PhotoComplete(date: (data?.favDate)!, url: (data?.favURL)!, name: data?.favName, button: true)
        presenter?.photoSelected(using: navigationController!, data: dat)
        favoriteListTableView.deselectRow(at: indexPath, animated: true)
    }
}
