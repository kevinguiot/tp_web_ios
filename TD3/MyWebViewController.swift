//
//  MyWebViewController.swift
//  TD3
//
//  Created by GUIOT Kevin on 20/01/2017.
//  Copyright © 2017 GUIOT Kevin / RUGOLETTO Romuald. All rights reserved.
//

import UIKit

class MyWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //On prépare le webview
        let monWeb = UIWebView();
        
        //On récupère l'URL 
        if let url = URL(string: "http://www.google.fr") {
            
            let request = URLRequest(url: url);
            monWeb.loadRequest(request);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
