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
        let maView = UIImageView(frame: CGRect(x: 0, y: 300, width: view.bounds.width, height: view.bounds.height));
        maView.backgroundColor = UIColor.darkGray;
        self.view.addSubview(maView);
    }
    
    @IBAction func definirImage(_ sender: UIButton) {
        
        //On récupère les views
        let myViews = view.subviews;
        
        //On parcourt les vues
        for vi : UIView in myViews {
            if(vi is UIImageView) {
                let vi2 = vi as! UIImageView;
                
                vi2.image = UIImage(named: "image2");
            }
        }
    }
    
    @IBAction func chargerImageViaWeb(_ sender: UIButton) {
        
        //On récupère l'URL de l'image
        let imageUrl:URL = URL(string: "http://www.kevinguiot.fr/dog.jpg")!
        
        //On récupère les datas de l'image
        let imageData = NSData(contentsOf: imageUrl)!
        
        //On récupère les views
        let myViews = view.subviews;
        
        //On parcourt les vues
        for vi : UIView in myViews {
            if(vi is UIImageView) {
                let vi2 = vi as! UIImageView;
                
                vi2.image = UIImage(data: imageData as Data);
            }
        }
    }
}
