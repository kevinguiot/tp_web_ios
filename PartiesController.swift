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
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }

        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototype", for: indexPath) as! Cellule
       
        //On récupère l'événement
        let event = eventsList[indexPath.row];
        
        //On récupère le favicon du lien
        let imageUrl:URL = URL(string: event.Flyer)!
        
        //On récupère les datas de l'image
        let imageData = NSData(contentsOf: imageUrl)!
        
        //On mets à jour la cellule
        cell.date?.text = "Le " + event.Date;
        cell.heure?.text = event.Heure + "H";
        cell.nom?.text = event.Name;
        cell.flyer?.image = UIImage(data: imageData as Data);

        return cell
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
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      /*  let web = self.storyboard?.instantiateViewController(withIdentifier: "MyWebView") as! Cellule
        web.website = self.websites[indexPath.row]
        self.navigationController?.pushViewController(web, animated: true)*/
    }
    
}

class Event {
    var Id : Int = 0;
    var Date: String = "";
    var Heure : String = "";
    var Name : String = "";
    var Desc : String = "";
    var Flyer : String = "";
    
    init(id : Int, dateString : String, name : String, desc : String,flyer : String) {
        
        //On parse le dateString pour y retrouver la date et l'heure
        var dateStringArr = dateString.components(separatedBy: " ");
        
        //On récupère la date
        var dateArr = dateStringArr[0].components(separatedBy: "-");
        
        var date = dateArr[2] + "/" + dateArr[1] + "/" + dateArr[0];
        
        //On récupère l'heure
        var heureArr = dateStringArr[1].components(separatedBy: ":");
        
        //On mets à jour les propriétés
        self.Id = id;
        self.Name = name;
        self.Desc = desc;
        self.Flyer = flyer;
        self.Date = date;
        self.Heure = heureArr[0];
    }
}
