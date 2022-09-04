import Foundation
import Alamofire

final class UserDetailIteractor: UserDetailInteractorInputProtocol {
    
    weak var presenter: (UserDetailInteractorOutputProtocol & UserDetailPresenterProtocol)?
    
    var userId = 0

    func viewDidAppear() {
        
        let detailUrl = "https://jsonplaceholder.typicode.com/posts?userId=\(userId)"
        
        
        AF.request(detailUrl,
               method: .get,
               parameters: nil,
               encoding: JSONEncoding.default
            )
        .responseDecodable { (response: DataResponse<[Post], AFError>) in
            switch response.result {
                case .success(let posts):
                    print("Recieved users: \(posts)")
                self.presenter?.obtainedPosts(posts: posts)
                case .failure(let error):
                    print("Failed with error: \(error)")
                }
        }
        
    }

}
