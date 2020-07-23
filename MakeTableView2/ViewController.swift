//
//  ViewController.swift
//  MakeTableView2
//
//  Created by 小島満天 on 2020/07/23.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit
import APIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBAction func gestureRecognizer(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //各種delegateやdataSource
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        //registerでカスタムセルの登録
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
        //リクエスト送信
        sendRequest()
    }
    //[Articles]のインスタンス化
    var articles: [Articles]?
    //リクエストの定義
    private func sendRequest() {
        let request = FetchiQiitaArticleRequest(baseURL: URL(string: "https://qiita.com/api/v2")!)
        
        Session.send(request) { result in
            switch result {
            case .success(let response):
                self.articles = response
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = articles else { return 0 }
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //カスタムセルの登録
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        if let articles = articles {
            cell.customLabel.text = articles[indexPath.row].title
            cell.customView.kf.setImage(with: URL(string: articles[indexPath.row].user.profile_image_url))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //遷移先のストーリーボードをインスタンス化
        let storyboard: UIStoryboard = UIStoryboard(name: "Next", bundle: nil)
        //遷移先のビューコントローラーをインスタンス化
        guard let nextViewController = storyboard.instantiateInitialViewController() as? NextViewController else { return }
        //画面遷移時に値を渡す
        if let articles = articles {
            nextViewController.urlStr = articles[indexPath.row].url
        }
        //画面遷移実行
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        search(searchText)
    }
    
    func search(_ text: String) {
        var newArray: [Articles] = []
        if articles != nil {
            articles?.forEach({
                if $0.title.lowercased().contains(text) {
                    newArray.insert($0, at: 0)
                } else {
                    newArray.append($0)
                }
            })
            articles = newArray
            tableView.reloadData()
            searchBar.endEditing(true)
        }
    }
}

