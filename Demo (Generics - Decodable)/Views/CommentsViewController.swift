//
//  CommentsViewController.swift
//  Demo (Generics - Decodable)
//
//  Created by hamdi on 04/05/2023.
//

import UIKit

class CommentsViewController: UIViewController {
 let commentsUrl = "https://jsonplaceholder.typicode.com/comments"
    var comments = [CommentsModel]()
    @IBOutlet weak var commentsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTableView.dataSource = self
        commentsTableView.dataSource = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global().async {
            APIService.shared.getData(url: self.commentsUrl, complition:{(comments:[CommentsModel]?,error)in
                if let error = error {
                    print(error)
                }else{
                    guard let comments = comments else{return}
                    DispatchQueue.main.async {
                        self.comments   = comments
                        self.commentsTableView.reloadData()
                    }
                }
                
            })
        }
    }
    

 

}
extension CommentsViewController :UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath)as?CommentsTableViewCell{
            cell.commentLabel.text = comments[indexPath.row].body
            return cell
        }
        return UITableViewCell()
    }
    
    
}
