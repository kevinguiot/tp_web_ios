//
//  PartiesController.swift
//  TD3
//
//  Created by GUIOT Kevin on 23/01/2017.
//  Copyright © 2017 GUIOT Kevin / RUGOLETTO Romuald. All rights reserved.
//

import UIKit
import SWXMLHash
import Foundation

class Cellule: UITableViewCell {
    @IBOutlet weak var heure: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var flyer: UIImageView!
}


class PartiesController: UITableViewController {
    
    //On créé un tableau d'Event
    var eventsList = [Event]();
    
    @IBOutlet var monTableau: UITableView!
    @IBOutlet var gesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let url = URL(string: "http://sealounge.lanoosphere.com/seadata_en.xml") {
            do {
                
                let contents = try String(contentsOf: url)
                
                let xmlContent = SWXMLHash.parse(contents);
                
                //On récupère les éléments
                let events = xmlContent["Data"]["Event"];
                
                //On parcourt les événements
                for i in 0...(events.all.count - 1) {
                    
                    let element = events[i].element!;
                    
                    //On récupère l'id
                    let id = Int(element.attribute(by: "id")!.text);
                    
                    //On récupère la date
                    let date = element.attribute(by: "date")!.text;
                    
                    //On récupère le nom
                    let name = element.attribute(by: "name")!.text;
                    
                    //On récupère la description
                    let desc = element.attribute(by: "desc")!.text;
                    
                    //On récupère le flyer
                    let flyer = element.attribute(by: "flyer")!.text;

                    //On définit l'événement
                    let event = Event(id: id!, dateString: date, name: name, desc: desc, flyer: flyer);
                    
                    //On rajoute l'événement dans le tableau
                    eventsList.append(event);
                }
                
            } catch {
                NSLog("chargement incorrect")
            }
        } else {
            NSLog("mauvaise URL");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //On récupère le nombre d'évent
        return self.eventsList.count;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //On récupère la cellule
        let cell = tableView.dequeueReusableCell(withIdentifier: "event", for: indexPath) as! Cellule
       
        //On récupère l'événement
        let event = eventsList[indexPath.row];
        
        //On mets à jour la cellule
        cell.date?.text = "Le " + event.Date;
        cell.heure?.text = event.Heure + "H";
        cell.nom?.text = event.Name;

        //On charge l'image
        loadImage(cellule:cell, flyer: event.Flyer);

        return cell
    }

    //On charge les images dans un thread
    func loadImage(cellule: Cellule, flyer: String)  {
        
        let queue = DispatchQueue(label: "com.kevinguiot.loadImage");
        
        queue.async {
           
            //On récupère le favicon du lien
            let imageUrl:URL = URL(string: flyer)!
            
            //On récupère les datas de l'image
            let imageData = NSData(contentsOf: imageUrl)!
            
            //On prépare l'image
            let image = UIImage(data: imageData as Data);
            
            cellule.flyer.image = image;
            /*
            let imageView = UIImageView(image: image);
            
            cellule.flyer = imageView
            */
            
        }
    }
}
