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
            
            //(FlagがTrueの場合)クイズを進める
            if(quizmaster.quizFlag == true){
                print(quizmaster.countMessage)
                instructionLabel.text = quizmaster.quiz[quizmaster.quizChoice][quizmaster.countMessage]
                quizmaster.instructionQuiz(choice: quizmaster.quizChoice)
            }
        case 15:        // 15:"."
            calculator.dotFlag = true
        case 16:        //16:"AC"
            allClearIndicate()
            calculator.allClearCalculate()
            quizmaster.allClearQuiz()
        case 17:        //17:Quiz
            //ランダムにクイズを選択する
            if(quizmaster.quizFlag == false){
                quizmaster.quizChoice = Int(arc4random() % 3)
                quizmaster.countMessage = 0
            }
            quizmaster.quizFlag = true
            print(quizmaster.countMessage)
            instructionLabel.text = quizmaster.quiz[quizmaster.quizChoice][quizmaster.countMessage]
            quizmaster.instructionQuiz(choice: quizmaster.quizChoice)
        default:
            break
        }
        
    }
    
    //オールクリアー(表示)機能
    func allClearIndicate(){
        //ViewControllerの変数のクリア
        formulaLabel.text = ""
        resultLabel.text = ""
        instructionLabel.text = ""
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

