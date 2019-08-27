//
//  ViewController.swift
//  ios-sample-xx
//
//  Created by Koganezawa on 2019/08/27.
//  Copyright © 2019 Koganezawa. All rights reserved.
//

import UIKit
import Geth
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // keystore ファイルを保存するディレクトリのパスを取得
        let dataDir = NSSearchPathForDirectoriesInDomains(
                .documentDirectory,
                .userDomainMask,
            true
        )[0]
        let keyStorePath = dataDir + "/keystore"
        print("keyStorePath: \(keyStorePath)")

        // keystore を管理してくれるやつのインスタンスを取得
        let keyStoreManager = GethNewKeyStore(keyStorePath, GethLightScryptN, GethLightScryptP)

        let uuid = UUID().uuidString
        print(uuid)

        // パスワードを指定してアカウントを作成
        let account = try! keyStoreManager?.newAccount(uuid)

        // 16進数表記のアカウントのアドレスを取得
        let address = account?.getAddress().getHex()
        print("address: \(address!)")

        // keystore ファイルの URL (パス) を表示
        let url = account?.getURL()
        print("url: \(url!)")

        let fileName = "data.txt"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathFileName = dir.appendingPathComponent(fileName)
            print("pathFileName: \(pathFileName)")
            do {
                try uuid.write(to: pathFileName, atomically: false, encoding: String.Encoding.utf8)
            } catch {
                //TODO
            }
        }
    }
}

