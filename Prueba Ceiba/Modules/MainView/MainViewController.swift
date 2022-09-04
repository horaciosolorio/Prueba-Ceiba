import UIKit
import CoreLocation

class MainViewController: UIViewController , MainViewProtocol {
   
    
    var presenter: (MainInteractorOutputProtocol & MainPresenterProtocol)?

    @IBOutlet weak var tableView: UITableView!
    private var isLoading = true
    
    var filteredUsers = [User]()
    
    let searchController = UISearchController()
    private let refreshControl = UIRefreshControl()
    private var cellReuseIdentifier = "UsersTableViewCell"
    private var users: [User] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        setUpTableView()
        setupSearchController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidAppear()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    private func setUpTableView() {
        // Refresh Control
        refreshControl.addTarget(self, action: #selector(MainViewController.reloadPlaces), for: .valueChanged)
        refreshControl.tintColor = .blue
        refreshControl.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        //Add to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        tableView.register(
            UINib(nibName: cellReuseIdentifier, bundle: nil),
            forCellReuseIdentifier: cellReuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        refreshControl.beginRefreshing()
    }
    
    func showUsers(users: [User]) {
        self.users = users
        stopTableLoading()
    }
    
    @objc private func reloadPlaces(_ sender: Any) {
        presenter?.viewDidAppear()
    }
    
    func showTableLoading() {
        refreshControl.beginRefreshing()
        isLoading = true
    }
    
    func stopTableLoading() {
        refreshControl.endRefreshing()
        isLoading = false
    }
    
    func loadDataInTable(users: [User]) {
        self.users = users
    }
    
    func showEmptyResults() {
        let alert = UIAlertController(title: "Aviso", message: "No hay resultados intenta con un radio mas amplio", preferredStyle: .alert)
        let done = UIAlertAction(title: "Entendido", style: .destructive, handler: { (action) -> Void in })
        alert.addAction(done)
        self.present(alert, animated: true, completion: nil)
        stopTableLoading()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
}


extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! UsersTableViewCell
        
        let currentU: User!
        
        if (searchController.isActive) {
            currentU = filteredUsers[indexPath.row]
        } else  {
            currentU = users[indexPath.row]
        }
        
        cell.setData(user: currentU)
        cell.frame.size.width = tableView.frame.size.width
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive) {
            return filteredUsers.count
        }
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (!isLoading) {
            
            let currentU: User!
            
            if (searchController.isActive) {
                currentU = filteredUsers[indexPath.row]
            } else  {
                currentU = users[indexPath.row]
            }
            
            if let userId = currentU.id {
                presenter?.goToUserDetail(userId: userId)
            }
        }
    }

}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}


extension MainViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searsearchTextMatchchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        self.filerForSearchText(searchText: searchText)
    }
    
    func filerForSearchText(searchText: String) {
        if (searchController.searchBar.text != "") {
            filteredUsers = users.filter { user in
                
                let searchTextMatch = user.name?.lowercased().contains(searchText.lowercased())
                return searchTextMatch ?? false
            }
        }
        tableView.reloadData()
    }
    
}

