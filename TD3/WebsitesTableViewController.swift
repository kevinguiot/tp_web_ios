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
        ("Twitter", "http://www.twitter.com")
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
        
       /* //On récupère la cellule
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "someCellIdentifier") as UITableViewCell?
        cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "someCellIdentifier")
       // cell!.imageView?.frame = CGRect(x: 0, y: 0, width: 140, height: 10);
        
        
        //On mets à jour les informations
        cell!.textLabel?.text = liensArray[indexPath.row].titre;
        cell!.detailTextLabel?.text = liensArray[indexPath.row].url;
        
        //On récupère les informations
        var nom = liensArray[indexPath.row].titre;
        var lien = liensArray[indexPath.row].url;
        var favicon = (lien + "/favicon.ico");

        //On récupère le favicon du lien
        let imageUrl:URL = URL(string: favicon)!
        
        //On récupère les datas de l'image
        let imageData = NSData(contentsOf: imageUrl)!
     
    
        //On créé l'image
        let imageFromUrl = UIImage(data: imageData as Data);
        
        /*et maNouvelleImage = UIImage;
        maNouvelleImage.*/
        
        //Mon image view
        
        
        
        
        
        
        //let monImage = resizeImage(image: UIImage(named: "image"), newWidth: CGFloat(66));

        let monImage = resizeImage(image: imageFromUrl!, targetSize: CGSize(width: 20, height: 20)); //UIIMage
        

        let mescouilles = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10));
        mescouilles.image = monImage
        



        //ON redimentionne l'image
        
        

        
        //ON ajoute les informations
        cell!.textLabel?.text = nom;
        cell!.textLabel?.backgroundColor = UIColor.red;
        
        
        

        
        cell!.detailTextLabel?.backgroundColor = UIColor.blue;
        cell!.detailTextLabel?.text = lien;
        //cell!.imageView?.image = maNouvelleImage;
        /*cell!.imageView?.frame = CGRect(x: 0, y: 0, width: 10, height: 10);
        cell!.imageView?.image = imageFromUrl;*/
        
       /* cell!.imageView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60);


        cell!.imageView?.image = monImage;
        cell!.imageView?.backgroundColor = UIColor.darkGray;
*/
        cell!.imageView?.image = mescouilles.image;
        cell!.imageView?.backgroundColor = UIColor.red;
       
        //On return
        return cell!*/
        
        //On récupère les informations
        var nom = liensArray[indexPath.row].titre;
        var lien = liensArray[indexPath.row].url;
        var favicon = (lien + "/favicon.ico");
        
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
        //self.tabBarController?.tabBar.barTintColor = liensArray[indexPath.row].color
        
        NSLog("sélection");
        
        //On créer une instance de web controller
        let maController = MyWebViewController();
        
        //on push dans le navigation controle
        let maNavigation = UINavigationController();
        
        
        maNavigation.pushViewController(maController, animated: true);
    }
}

/*
func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
    
    var newImage = UIImage();
    newImage = image;
    
    
    
    
    
    let scale = newWidth / image.size.width
    let newHeight = image.size.height * scale
    UIGraphicsBeginImageContext(CGSize(width: 0, height: 0));
    image.draw(in: CGRect(x: 0, y: 0, width: 5, height: 5));
    
    
    //let newImage = UIGraphicsGetImageFromCurrentImageContext()
    //UIGraphicsEndImageContext()
    
    
    
    return newImage

    
    //return newImage
}

*/

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
    
    // This is the rect that we've calculated out and this is what is actually used below
    //let rect = CGRectMake(0, 0, newSize.width, newSize.height)
    
   // let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height);
    
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height);
    

    
    // Actually do the resizing to the rect using the ImageContext stuff
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
    
    /*override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    */
    
    // Here you can customize the appearance of your cell
    override func layoutSubviews() {
        super.layoutSubviews()
        // Customize imageView like you need
        /*self.imageView?.frame = CGRect(x: 10, y: 0, width: 40, height: 40)

        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit*/
        // Costomize other elements

       // self.textLabel?.leftAnchor = NSLayoutXAxisAnchor();
        
        self.contentView.backgroundColor = UIColor.darkGray;
        
        //cellToDeSelect.contentView.backgroundColor = colorForCellUnselected
        
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 16);
        self.textLabel?.drawText(in: CGRect(x: 5, y: 5, width: 5, height: 5));
     //   self.textLabel?.frame = UIEdgeInsetsInsetRect( CGRect(x: 60, y: 0, width: self.frame.width - 45, height: 15), UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20));
        
        
        self.textLabel?.frame = CGRect(x: 60, y: 0, width: self.frame.width - 45, height: 15)
        self.textLabel?.backgroundColor = UIColor.lightGray
        
      //  self.textLabel?.frame = CGRectMake(60, 0, self.frame.width - 45, 20)
        
        self.detailTextLabel?.frame = CGRect(x: 60, y: 15, width: self.frame.width - 45, height: 29)
        self.detailTextLabel?.backgroundColor = UIColor.lightGray;

        //self.detailTextLabel?.frame = CGRectMake(60, 20, self.frame.width - 45, 15)
    }
}




/*

class WebsitesTableViewController: UITableViewController {
    
    
  //  @IBOutlet weak var tableView: UITableView;

    @IBOutlet var ok: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        self.ok.delegate = self;
        self.ok.dataSource = self;
        self.ok.register(UITableViewCell.self, forCellReuseIdentifier: "someCellIdentifier");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 46465;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        NSLog("ok");
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "someCellIdentifier", for: indexPath);
        
        
        cell.backgroundColor = UIColor.red;
        cell.textLabel?.text = "test";
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tabBarController?.tabBar.barTintColor = UIColor.blue;
        
         NSLog("ok");
    }

    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
/*
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}*/
