//
//  MyWebViewController.swift
//  TD3
//
//  Created by GUIOT Kevin on 20/01/2017.
//  Copyright © 2017 GUIOT Kevin / RUGOLETTO Romuald. All rights reserved.
//
 
import UIKit

class MyWebViewController: UIViewController, UIWebViewDelegate {
    
    var urlString: String = "";
    var monWeb = UIWebView();

    override func viewDidLoad() {
        super.viewDidLoad()

        monWeb = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height));
    
        self.view.addSubview(monWeb);
        
        let monUrl = URL(string: urlString);
        let monUrlRequest:URLRequest = URLRequest(url: monUrl!);
        
        monWeb.loadRequest(monUrlRequest);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
