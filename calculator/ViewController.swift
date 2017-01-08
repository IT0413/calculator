//
//  ViewController.swift
//  calculator
//
//  Created by 伊藤孝史 on 2016/12/18.
//  Copyright © 2016年 伊藤孝史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    //calculateClassのインスタンス作成
    var calculator = calculateClass()
    var quizmaster = quizClass()
//記号のボタンの定義
    let symbol:Dictionary<Int,String> = [
        10:"+", 11:"-", 12:"*", 13:"/", 14:"=", 15:".", 16:"AC", 17:"Quiz"
    ]

//UIのテキスト変数
    var formulaText:String = ""//数式の表示変数
    var resultText:String = ""//計算結果の表示変数

//テキストフィールドの宣言
    @IBOutlet weak var formulaLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var instructionText: UILabel!


    //数字ボタン押下時のアクション
    @IBAction func numberButtonAction(_ sender: UIButton) {
        calculator.createSource(input:sender.tag, flag:calculator.dotFlag)
    }

    //記号ボタン押下時のアクション
    @IBAction func symbolButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case (10...13): //10:"+", 11:"-", 12:"*", 13:"/"
            calculator.translateSourceToDestination(input: symbol[sender.tag]!)
        case 14:        //14:"="
            calculator.calculate(src:calculator.calculateSource,dst:calculator.calculateDestination,ope:symbol[sender.tag]!)
        case 15:        // 15:"."
            calculator.dotFlag = true
        case 16:        //16:"AC"
            allClearStates()
        case 17:
            quizmaster.startQuiz()
            quizmaster.instructionQuiz()
        default:
            break
        }
    }
    

    //ボタンの入力に合わせて画面上にテキストを表示する機能
    func indicateText(src:String, ope:String, dst:String, rst:String){
        formulaLabel.text = dst + ope + src
        resultLabel.text = rst
    }
    func indicateText(src:String, rst:String){
        formulaLabel.text = src
        resultLabel.text = rst
    }
    func indicateText(dst:String, rst:String){
        formulaLabel.text = dst
        resultLabel.text = rst
    }
    
    //オールクリアー機能
    func allClearStates(){
        //ViewControllerの変数のクリア
        formulaText = ""
        resultText = ""
        indicateText(src:"", ope:"", dst:"", rst:"")
        
        //CalculateClassの変数のクリア
        calculator.calculateSource = 0
        calculator.calculateDestination = 0
        calculator.countDigit = 0
        calculator.countDecimalDigit = 0
        calculator.dotFlag = false

        //quiz関連の変数のクリア
        instructionText.text = ""
        quizmaster.quizFlag = false
        quizmaster.countMessage = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

