//
//  ViewController.swift
//  calculator
//
//  Created by 伊藤孝史 on 2016/12/18.
//  Copyright © 2016年 伊藤孝史. All rights reserved.
//

//検討課題①：src,dst,rstのオーバフロー対策
//検討課題②：演算子が連続して入力された際の挙動(あるべき姿含めてどう対応するのか)
//検討課題③：クイズのUI


import UIKit
class ViewController: UIViewController{

    //記号のボタンの定義
    let symbol:Dictionary<Int,String> = [
        10:"+", 11:"-", 12:"*", 13:"/", 14:"=", 15:".", 16:"AC", 17:"Quiz"
    ]

    @IBOutlet weak var formulaLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    //calculateClassのインスタンス作成
    var creator = viewCreatorClass()
    var calculator = calculateClass()
    var quizmaster = quizClass()
    
    //数字ボタン押下時のアクション
    @IBAction func numberButtonAction(_ sender: UIButton) {
        let temp = calculator.createSource(input:sender.tag, flag:calculator.dotFlag)
        formulaLabel.text = temp.source
        resultLabel.text = temp.result
    }

    //記号ボタン押下時のアクション
    @IBAction func symbolButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case (10...13): //10:"+", 11:"-", 12:"*", 13:"/"
            let temp = calculator.translateSourceToDestination(input: symbol[sender.tag]!)
            formulaLabel.text = temp.destination
            resultLabel.text = temp.result
        case 14:        //14:"="
            let temp = calculator.calculate(src: calculator.calculateSource,dst: calculator.calculateDestination,ope:calculator.inputOperator)
            formulaLabel.text = "\(temp.destination) \(temp.operator) \(temp.source)"
            resultLabel.text = temp.result
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
    
    //オールクリアー機能
    func allClearStates(){
        //ViewControllerの変数のクリア
        formulaLabel.text = ""
        resultLabel.text = ""
        
        //CalculateClassの変数のクリア
        calculator.calculateSource = 0
        calculator.calculateDestination = 0
        calculator.countDigit = 0
        calculator.countDecimalDigit = 0
        calculator.dotFlag = false
        
        //quiz関連の変数のクリア
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

