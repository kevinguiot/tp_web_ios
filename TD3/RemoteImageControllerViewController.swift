//
//  RemoteImageControllerViewController.swift
//  TD3
//
//  Created by GUIOT Kevin on 16/01/2017.
//  Copyright © 2017 GUIOT Kevin / RUGOLETTO Romuald. All rights reserved.
//

import UIKit

class RemoteImageControllerViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addObjectImage(_ sender: UIButton) {
        
        //On créé une image
        
        
        
        var monImage = UIImageView();
        
        
        
        self.view.addSubview(monImage);
        
        NSLog("ok");
        
    }
    
    @IBAction func definirImage(_ sender: UIButton) {

        //On récupère le nom de l'image
        let imageName = "image2.png";
        
        //On récupère l'image voulue à partir de son nom
        let monImage = UIImage(named: imageName);
        
        //On ajoute l'image à l'image view
        let monImageView = UIImageView(image: monImage);
        
        //On rajoute l'image à la vue
        self.view.addSubview(monImageView);
    }

    
    @IBAction func chargerImageViaWeb(_ sender: UIButton) {
        
        //On récupère l'URL de l'image
        let imageUrl:URL = URL(string: "http://www.kevinguiot.fr/photo.png")!
        
        //On récupère les datas de l'image
        let imageData = NSData(contentsOf: imageUrl)!

        //On créé l'image
        let imageFromUrl = UIImage(data: imageData as Data);

        //On créé l'imageView
        let imageView = UIImageView(image: imageFromUrl)

        //On fait en sorte que l'image chargée prend toujours la largeur totale de l'écran
        imageView.backgroundColor = UIColor.darkGray;
        
        //On rajoute l'image à la vue
        self.view.addSubview(imageView);
    }
}
