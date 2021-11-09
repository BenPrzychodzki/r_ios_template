//
//  ViewController.swift
//  SquidGameMeter
//
//  Created by Michał Górka on 03/11/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let cellSpacingHeight: CGFloat = 25
    @IBOutlet var tableView: UITableView!
    
    var players = [PlayerModel]()
    
    var globalVars = MyVariables()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        parseJson()
        // tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        tableView.reloadData()
    }
    
    private func getImg(player: PlayerModel) -> Data? {
        let url = URL(string: player.pict!)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            return data
        }
        return nil
        
    }
    
    
    private func parseJson() {
        guard let path = Bundle.main.path(forResource: "players", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
                
        do {
            let jsonData = try Data(contentsOf: url)
            players = try JSONDecoder().decode([PlayerModel].self, from: jsonData)
            
            // self.populate(with: players!)
            
        }
        catch {
            print("Error: \(error)")
        }
        
    }
    
    
}

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "playerDetails") as! DetailsViewController
        vc.player = players[indexPath.row]
        vc.playerId = indexPath.row
        vc.globalVars = globalVars
        vc.title = players[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        
        
        cell.playerName?.text = players[indexPath.row].name
        if players[indexPath.row].pict != nil {
            cell.playerImage?.image = UIImage.init(data: getImg(player: players[indexPath.row])!)
        }
        else {
            cell.playerImage?.image = UIImage.init(named: "Portrait_Placeholder")
        }
        
        
        if globalVars.isEliminated[indexPath.row] == true {
            let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
            currentFilter!.setValue(CIImage(image: (cell.playerImage?.image)!), forKey: kCIInputImageKey)
            let output = currentFilter!.outputImage
            let cgimg = CIContext(options: nil).createCGImage(output!,from: output!.extent)
            let processedImage = UIImage(cgImage: cgimg!)
            cell.playerImage?.image = processedImage
        }
        
        
        

//        cell.textLabel?.font = UIFont.systemFont(ofSize: 30.0)
        return cell
    }
    
}


