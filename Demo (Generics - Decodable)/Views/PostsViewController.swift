//
//  PostsViewController.swift
//  Demo (Generics - Decodable)
//
//  Created by hamdi on 04/05/2023.
//

import UIKit

class PostsViewController: UIViewController {
    @IBOutlet weak var postsTableView: UITableView!
    let postsUrl = "https://jsonplaceholder.typicode.com/posts"
    var posts = [PostsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.delegate = self
        postsTableView.dataSource = self  
        
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global().async {
           APIService.shared.getData(url:self.postsUrl, complition: {(posts:[PostsModel]?,error) in
                if let error = error  {
                    print(error)
                }else{
                    guard let posts = posts else {return}
                    DispatchQueue.main.async {
                        self.posts = posts
                        self.postsTableView.reloadData()
                    }
                }
            })
        }
    }
    

  
}
//
extension PostsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as?PostsTableViewCell{
            cell.postLable.text = posts[indexPath.row].body
            return cell
        }
     return UITableViewCell()
    }
    
    
}
