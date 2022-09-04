import Foundation
import Alamofire

final class MainIteractor: MainInteractorInputProtocol {
    
    weak var presenter: (MainInteractorOutputProtocol & MainPresenterProtocol)?

    func viewDidAppear() {
        
        let mainUrl = "https://jsonplaceholder.typicode.com/users"
        
        AF.request(mainUrl,
               method: .get,
               parameters: nil,
               encoding: JSONEncoding.default
            )
        .responseDecodable { (response: DataResponse<[User], AFError>) in
            switch response.result {
                case .success(let users):
                    print("Recieved users: \(users)")
                self.presenter?.obtainedUsers(users: users)
                case .failure(let error):
                    print("Failed with error: \(error)")
                }
        }
        
    }

}
