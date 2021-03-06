//
//  ViewController.swift
//  sampleTableView001
//
//  Created by yuka on 30/10/2017.
//  Copyright © 2017 yuka. All rights reserved.
//

import UIKit
//var vc_teaList = ["★ダージリン★","★アールグレイ★","★アッサム★","★オレンジペコ★"]

//1.プロトコルの設定（DataSource,Delegate）
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    
//    var teaList = ["ダージリン","アールグレイ","アッサム","オレンジペコ"]
    
    //何行目が選択されたか保存する変数
    //-1は何も行番号が保存されていないという目印
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Stroyboadで設定する（PickerViewのときはプログラムで設定した。どっちでもできる)
        // 4. storyboadに,指示を出すのがViewControllerだと設定する
        //プログラムで書くとしたら以下
//        myTableView.dataSource = self
//        myTableView.delegate   = self
        
        //5.tableViewにCellオブジェクトを追加してidentifierにつけた名前と同じ名前を付ける
        
        print("1枚目が表示されたよ")
    }

   
    //2.行数の決定
    // numberofrowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var retValue = 0
//        switch section {
//        case 0:
//            retValue = 10
//        case 1:
//            retValue = 3
//        default:
//            retValue = 10
//        }
        
        return vc_teaList.count
        
    }
    
    //試しに入れているコード。２列になるかの確認 yuka
    //Section グルーピングの設定
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }

    //3.リストに表示する文字列を決定し、表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //文字列を表示するせるの取得（セルの再利用）
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellko", for: indexPath)
        

        switch indexPath.section {
        case 0:
            //表示したい文字の設定
//            cell.textLabel?.text = "セクション０　\(indexPath.row)行目"
            cell.textLabel?.text = vc_teaList[indexPath.row]
            cell.textLabel?.textColor = UIColor.brown
            
        case 1:
            //表示したい文字の設定
            cell.textLabel?.text = "セクション１　\(indexPath.row)行目"

            
        default:
            //表示したい文字の設定
            cell.textLabel?.text = "\(indexPath.row)行目"
            
        }
        //文字を設定したせるを返す
        return cell
    }
    
    // セルをタップしたら発動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)行目がタップされました")
        
        //選択された行番号を保存
        selectedIndex = indexPath.row
        
        //セグエの名前を指定して、画面遷移処理を発動
        performSegue(withIdentifier: "showDetail", sender: nil)
        tableView.separatorColor = UIColor.red

    }
    
    // セグエを使って、画面遷移している時は発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面のインスタンス(オブジェクト）を取得
        var dvc:DetailViewController = segue.destination as! DetailViewController
        
        //次の画面のプロパティ（メンバ変数）passedIndexに選択された行番号を渡す
        dvc.passedIndex = selectedIndex
        print(selectedIndex)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

