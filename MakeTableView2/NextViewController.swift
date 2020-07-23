//
//  NextViewController.swift
//  MakeTableView2
//
//  Created by 小島満天 on 2020/07/23.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit
import WebKit

class NextViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //webサイトを開く
        openURL(urlStr)
    }
    
    //画面遷移時に値を受け取るプロパティ
    var urlStr: String = ""
    //webサイトを開くメソッド
    func openURL(_ string: String?) {
        if string != nil {
            let url = URL(string: urlStr)!
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
