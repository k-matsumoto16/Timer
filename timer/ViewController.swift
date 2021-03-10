//
//  ViewController.swift
//  timer
//
//  Created by 松本光輝 on 2021/03/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    //タイマー
    var timer: Timer!
    
    //タイマー用の時間のための変数
    var timer_sec: Float = 0 //浮動小数点型、Float型
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    //self クラス内で一時的に変数か分ける
    @objc func updateTimer(_ timer: Timer) {
        //0.1を代入
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
    }
    
    //再生ボタン
    @IBAction func startTimer(_ sender: Any) {
        // 動作中のタイマーを1つに。timer が存在しない場合だけ、タイマーを生成して動作させる
        //nil 存在しない
        if self.timer == nil {
        //再生ボタンを押すとタイマー作成、始動
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
     }
    }
    
    //一時停止ボタン
    @IBAction func pauseTimer(_ sender: Any) {
        // !=は等しくない時　nilと等しくない時
        if self.timer != nil {
        //タイマー停止
        //invalidateは無効化メゾット
        self.timer.invalidate()
        self.timer = nil
        //startTimer()がnilかどうかチェックする
     }
    }
    
    //リセットボタン
    @IBAction func resetTimer(_ sender: Any) {
        //リセットボタンを押すと、タイマーの時間を0
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        // !=は等しくない時　nilと等しくない時
        if self.timer != nil {
            //タイマーを停止、nilかどうかチェック
            self.timer.invalidate()
            self.timer = nil
        }
    }
}
