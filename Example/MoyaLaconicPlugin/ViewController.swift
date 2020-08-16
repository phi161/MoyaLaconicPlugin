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
    let lastFMprovider: MoyaProvider<LastfmTarget>

    required init?(coder: NSCoder) {
        provider = MoyaProvider<MultiTarget>(plugins: [
            LaconicPlugin()
            ])
        lastFMprovider = MoyaProvider<LastfmTarget>(plugins: [
            LaconicPlugin(pluginIdentifier: "*️⃣", requestIdentifier: "➡️", responseIdentifier: "⬅️", successIdentifier: "🆗", failureIdentifier: "🆖")
            ]
        )
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Multitarget, default plugin
        provider.request(MultiTarget.target(HTTPCatTarget.catNotFound), completion: { _ in })
        provider.request(MultiTarget.target(LastfmTarget.friends(user: "ok_not_ok_", limit: 10)), completion: { _ in })
        provider.request(MultiTarget.target(HTTPCatTarget.catOk), completion: { _ in })

        // Single target, custom plugin
        lastFMprovider.request(.friends(user: "ok_not_ok_", limit: 10)) { _ in }
        lastFMprovider.request(.friends(user: "tool667", limit: 10)) { _ in }
        lastFMprovider.request(.topTracks(user: "ok_not_ok_", limit: 10)) { _ in }
    }

}

