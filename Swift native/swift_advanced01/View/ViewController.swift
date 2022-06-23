//
//  ViewController.swift
//  swift_advanced01
//
//  Created by BOUDIER Nicolas on 20/06/2022.
//

import UIKit
import Combine
import Kingfisher


//MODEL
struct ContactModel: Codable{
    var results: [Results]
    var info: Info
    
    struct Results: Codable{
        var name: Name
        var picture: Picture
    }
    
    struct Name: Codable{
        var title: String
        var first: String
        var last: String
    }
    
    struct Info: Codable{
        var seed: String
    }
    struct Picture: Codable{
        var large: String
    }
}

class ViewControllerCell: UITableViewCell{
    
    
    @IBOutlet weak var nameImage: UILabel!
    @IBOutlet weak var imageProfil: UIImageView!
}


class ViewModel{
    @Published var data: [ContactModel.Results] = []
    var seed: String = ""
    var cancellable: [AnyCancellable] = []
    var webService: WebService<ContactModel>
    
    init(){
        let url = URL(string: "https://randomuser.me/api/?results=50")!
        webService = WebService(url: url)
        webService.$result
            .sink{
            [weak self] modelFromApi in
            if let res = modelFromApi{
                self?.seed = res.info.seed
                self?.data = res.results
            }
        }.store(
            in: &cancellable
        )
    }

    
    func refresh(){
        webService.fetch()
    }
    
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List View"
        
        initTableView()
        startListening()
        addBarBtn()
    }
    func addBarBtn(){
        let refreshBtn = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(refreshData))
        navigationItem.rightBarButtonItem = refreshBtn
    }
    
    @objc func refreshData(){
        viewModel.refresh()
    }
    
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func startListening(){
        viewModel.$data
            .receive(on: DispatchQueue.main)
            .sink{
                [weak self] model in
                self?.tableView.reloadData()
                self?.title = self?.viewModel.seed
            }
            .store(in: &viewModel.cancellable)
    }
    
    
}

//GERE LES ACTIONS
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let transition = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let sendName = viewModel.data[indexPath.row]
        
        transition.profil = viewModel.data[indexPath.row]
        
        navigationController?.pushViewController(transition, animated: true)
        
        print(sendName)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Supprimer ?"){
            action, view, completion in
            //SUPRRIME LA DATA
//            self.viewModel.data.remove(at: indexPath.row)
            //UPDATE LA LISTE
            self.tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
//GERE LES DONNEES
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(viewModel.data.count)
        return viewModel.data.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = viewModel.data[indexPath.row].name
        let imageURL = URL(string: viewModel.data[indexPath.row].picture.large)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewControllerCell") as! ViewControllerCell
//        cell.textLabel?.text = viewModel.data[indexPath.row]
        cell.nameImage?.text = name.first + " " + name.last
        cell.imageProfil.kf.setImage(with: imageURL)
        cell.detailTextLabel?.text = ""
        return cell
    }
       
}
