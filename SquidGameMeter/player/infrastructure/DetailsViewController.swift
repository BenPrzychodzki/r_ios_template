//
//  DetailsViewController.swift
//  SquidGameMeter
//
//  Created by Szymon Trochimiak on 09/11/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var context = CIContext(options: nil)

    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelDescription: UILabel!
    @IBOutlet var imagePlayer: UIImageView!
    
    @IBOutlet weak var eliminateButton: UIButton!
    
    @IBAction func onEliminateButtonPressed(_ sender: Any) {
        globalVars?.isEliminated[playerId!] = !(globalVars?.isEliminated[playerId!])!
        isEliminated()
        
    }
    // @IBOutlet var
    
    var player: PlayerModel?
    var playerId: Int?
    var globalVars: MyVariables?
    
    private func isEliminated() {
        if globalVars?.isEliminated[playerId!] == true {
            eliminateButton.setTitle("Eliminated".localized(), for: .normal)
        }
        else {
            eliminateButton.setTitle("Eliminate".localized(), for: .normal)
        }
        setImage()
    }
    
    private func setImage() {
        
        if player!.pict != nil {
            imagePlayer.image = UIImage.init(data: getImg(player: player!)!)
        }
        else {
            imagePlayer.image = UIImage.init(named: "Portrait_Placeholder")
        }
        
        if globalVars?.isEliminated[playerId!] == true {
            let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
            currentFilter!.setValue(CIImage(image: imagePlayer.image!), forKey: kCIInputImageKey)
            let output = currentFilter!.outputImage
            let cgimg = context.createCGImage(output!,from: output!.extent)
            let processedImage = UIImage(cgImage: cgimg!)
            imagePlayer.image = processedImage
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = "Name".localized() + ": \(player!.name)"
        labelDescription.text = "Description".localized() + ": \(player!.description)"

        isEliminated()

        
        

        // Do any additional setup after loading the view.
    }
    
    private func getImg(player: PlayerModel) -> Data? {
        let url = URL(string: player.pict!)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            return data
        }
        return nil
        
    }
}

