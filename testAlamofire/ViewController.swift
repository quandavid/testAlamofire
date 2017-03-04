//
//  ViewController.swift
//  testAlamofire
//
//  Created by Quan Nguyen Dinh on 3/4/17.
//  Copyright © 2017 Quan Nguyen Dinh. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    let urlRequest = "http://www.envol91.mb.ca/wp-content/uploads/2013/03/ima.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let destination = DownloadRequest.suggestedDownloadDestination()
        
        Alamofire.download(urlRequest, to: destination).response { response in // method defaults to `.get`
            print(response.request ?? "")
            print(response.response ?? "")
            print(response.temporaryURL ?? "")
            print(response.destinationURL ?? "")
            let data = try? Data(contentsOf: response.destinationURL!)
            self.imageView.image = UIImage(data: data!)
            print(response.error ?? "")
        }
    }



}

