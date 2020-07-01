//
//  ViewController.swift
//  MoyaLaconicPlugin
//
//  Created by phi161 on 05/19/2020.
//  Copyright (c) 2020 phi161. All rights reserved.
//

import UIKit
import Moya
import MoyaLaconicPlugin

class ViewController: UIViewController {

    let provider: MoyaProvider<MultiTarget>

    required init?(coder: NSCoder) {
        provider = MoyaProvider<MultiTarget>(plugins: [
            LaconicPlugin()
            ])
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        provider.request(MultiTarget.target(LastfmTarget.friends(user: "ok_not_ok_", limit: 10)), completion: { _ in })
        provider.request(MultiTarget.target(HTTPCatTarget.catOk), completion: { _ in })
    }

}

