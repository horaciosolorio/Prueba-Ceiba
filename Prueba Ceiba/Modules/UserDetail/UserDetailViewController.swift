import UIKit
import CoreLocation

class UserDetailViewController: UIViewController , UserDetailViewProtocol {

    var presenter: (UserDetailInteractorOutputProtocol & UserDetailPresenterProtocol)?

    @IBOutlet weak var tableView: UITableView!
    private var isLoading = true
    
    private let refreshControl = UIRefreshControl()
    private var cellReuseIdentifier = "PostTableViewCell"
    private var posts: [Post] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidAppear()
    }
    
    private func setUpTableView() {
        // Refresh Control
        refreshControl.addTarget(self, action: #selector(UserDetailViewController.reloadPlaces), for: .valueChanged)
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
    
    func showUsers(posts: [Post]) {
        self.posts = posts
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
    
    func loadDataInTable(posts: [Post]) {
        self.posts = posts
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
    
    @IBAction func backBtn(_ sender: Any) {
        presenter?.backtoUsers()
    }
    
    func showLoading(with message: String) {
        
    }
    
    func showLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func showAlertError(error: String) {
        
    }
    
    func showPosts(users: [Post]) {
        self.posts = users
        stopTableLoading()
    }
    
    func showAlertMessage(title: String, message: String) {
        
    }
    
}

extension UserDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! PostTableViewCell
        let currentU: Post = posts[indexPath.row]
        cell.setData(post: currentU)
        cell.frame.size.width = tableView.frame.size.width
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

}

extension UserDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}








