//
//  Event.swift
//  TD3
//
//  Created by GUIOT Kevin on 27/01/2017.
//  Copyright © 2017 GUIOT Kevin / RUGOLETTO Romuald. All rights reserved.
//

import UIKit

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
        
        let date = dateArr[2] + "/" + dateArr[1] + "/" + dateArr[0];
        
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
