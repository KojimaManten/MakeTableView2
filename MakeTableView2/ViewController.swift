//
//  ViewController.swift
//  MakeTableView2
//
//  Created by 小島満天 on 2020/07/23.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //registerでカスタムセルの登録
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //カスタムセルの登録
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.customLabel.text = "俺にはできる！俺にはできる！俺には俺がついている！！"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //遷移先のストーリーボードをインスタンス化
        let storyboard: UIStoryboard = UIStoryboard(name: "Next", bundle: nil)
        //遷移先のビューコントローラーをインスタンス化
        guard let nextViewController = storyboard.instantiateInitialViewController() as? NextViewController else { return }
        //画面遷移時に値を渡す
        nextViewController.urlStr = "https://www.youtube.com/watch?v=B_TFakdr0lo&list=RDB_TFakdr0lo&start_radio=1"
        //画面遷移実行
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
}

