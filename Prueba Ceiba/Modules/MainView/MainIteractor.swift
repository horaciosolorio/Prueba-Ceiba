import Foundation
import Alamofire
import CoreData
import UIKit

final class MainIteractor: MainInteractorInputProtocol {
    
    weak var presenter: (MainInteractorOutputProtocol & MainPresenterProtocol)?
    
    let context = (UIApplication.shared.delegate as! AppDelegate) .persistentContainer.viewContext

    
    var savedUsers = [User]()
    
    func viewDidAppear() {
        
        getSavedUsers()
        
        if (savedUsers.isEmpty) {
            print("Users from API")
            loadUsersFromAPI()
        }
        else {
            print("USers from DB")
            self.presenter?.obtainedUsers(users: savedUsers)
        }
        
    }
    
    
    func loadUsersFromAPI() {
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
                    for user in users {
                        self.saveUser(user: user)
                    }
                    self.presenter?.obtainedUsers(users: users)
                case .failure(let error):
                    print("Failed with error: \(error)")
                }
        }
    }
    
    func saveUser(user: User) {
        let model = UserList(context: context)
        model.userId = Int16(user.id ?? 0)
        model.name = user.name
        model.email = user.email
        model.phone = user.phone
        saveContext()
    }
    
    func getSavedUsers() {
        let request = NSFetchRequest<UserList>(entityName: "UserList")
        do {
           let users = try context.fetch(request)
            for user in users {
                let user = User(name: user.name, id: Int(user.userId), email: user.email, phone: user.phone)
                savedUsers.append(user)
            }
        }
        catch {
            print(error)
        }
    }

}
