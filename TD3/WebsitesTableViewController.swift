//
//  WebsitesTableViewController.swift
//  TD3
//
//  Created by GUIOT Kevin on 19/01/2017.
//  Copyright © 2017 GUIOT Kevin / RUGOLETTO Romuald. All rights reserved.
//
 
import UIKit

class WebsitesTableViewController: UITableViewController {
    
    @IBOutlet var ok: UITableView!
    
    let liensArray: [(titre: String, url: String)] = [
        ("Google", "http://www.google.com"),
        ("Facebook", "http://www.facebook.com"),
        ("Twitter", "http://www.twitter.com"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "someCellIdentifier")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liensArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //On récupère les informations
        let nom = liensArray[indexPath.row].titre;
        let lien = liensArray[indexPath.row].url;
        let favicon = (lien + "/favicon.ico");
        
        //On récupère le favicon du lien
        let imageUrl:URL = URL(string: favicon)!
        
        //On récupère les datas de l'image
        let imageData = NSData(contentsOf: imageUrl)!
        
        //On créé l'image
        let imageFromUrl = UIImage(data: imageData as Data);
        
        let cell: CustomTableViewCell = CustomTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "someCellIdentifier")
  
        cell.imageView?.image = resizeImage(image: imageFromUrl!, targetSize: CGSize(width: 25, height: 25)); //UIIMage
        cell.textLabel?.text = nom;

        
        cell.detailTextLabel?.text = lien;
        cell.backgroundColor = UIColor.darkGray;
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //On récupère les informations
        let nom = liensArray[indexPath.row].titre;
        let lien = liensArray[indexPath.row].url;
        
        //On créer une instance de web controller
        let maController = MyWebViewController();
        
        //On précise l'URL du controlelr
        maController.urlString = lien;

        self.navigationController?.pushViewController(maController, animated: true);
       /* self.navigationController?.navigationBar.topItem?.title = "top";
        self.navigationController?.navigationBar.backItem?.title = "back";*/
    }
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width, height: size.height);
    } else {
        newSize = CGSize(width: size.width * widthRatio,height: size.height * widthRatio)
    }
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height);
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    
    image.draw(in: rect);
    

    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

class CustomTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // Here you can customize the appearance of your cell
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.backgroundColor = UIColor.darkGray;

        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 16);
        self.textLabel?.drawText(in: CGRect(x: 5, y: 5, width: 5, height: 5));

        self.textLabel?.frame = CGRect(x: 60, y: 0, width: self.frame.width - 45, height: 15)
        self.textLabel?.backgroundColor = UIColor.lightGray
        
        self.detailTextLabel?.frame = CGRect(x: 60, y: 15, width: self.frame.width - 45, height: 29)
        self.detailTextLabel?.backgroundColor = UIColor.lightGray;
    }
}
