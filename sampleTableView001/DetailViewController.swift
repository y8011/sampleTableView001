//
//  DetailViewController.swift
//  sampleTableView001
//
//  Created by yuka on 03/11/2017.
//  Copyright © 2017 yuka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTextView: UITextView!
    


    //受け取った行番号
    var passedIndex = -2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myLabel.text = vc_teaList[passedIndex]
        myImageView.image = UIImage(named: teaImage[passedIndex] )
        myTextView.text = teaExplainList[passedIndex]

        //ナニコレ？
        myImageView.animationDuration = 1.0


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //リンク？？
    func link(){
        if let url = URL(string: "http://nexseed.net/") {
            UIApplication.shared.open(url, options: [:])
        }

    }

    //ジェスチャ〜？
    @IBAction func gestureSlide(_ sender: UIScreenEdgePanGestureRecognizer) {
        print("gesture")
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
