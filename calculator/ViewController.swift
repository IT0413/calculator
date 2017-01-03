//
//  ViewController.swift
//  calculator
//
//  Created by 伊藤孝史 on 2016/12/18.
//  Copyright © 2016年 伊藤孝史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
//UIのボタン変数
    var inputNumber:Int = 0//ボタン入力時の変数
    var dotFlag:Bool = false
    var countDigit:Int = 0//ケタ数(整数)
    var countDecimalDigit:Int = 0//ケタ数(小数)
    
//UIのテキスト変数
    var formulaText:String = ""//数式の表示変数
    var resultText:String = ""//計算結果の表示変数

//凡例：計算される数 演算子 計算する数 = 計算結果
    var calculateSource:Double = 0.0//計算する数
    var calculateDestination:Double = 0.0 //計算される数
    var inputOperator:String = ""//演算子
    var calculateResult:Double = 0.0//計算結果
    
//テキストフィールドの宣言
    @IBOutlet weak var formulaLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

//各ボタンの宣言
    @IBAction func zeroButton(_ sender: Any) {
        createSource(input:0, flag:dotFlag)
    }
    @IBAction func oneButton(_ sender: Any) {
        createSource(input:1, flag:dotFlag)
    }
    @IBAction func twoButton(_ sender: Any) {
        createSource(input:2, flag:dotFlag)
    }
    @IBAction func threeButton(_ sender: Any) {
        createSource(input:3, flag:dotFlag)
    }
    @IBAction func fourButton(_ sender: Any) {
        createSource(input:4, flag:dotFlag)
    }
    @IBAction func fiveButton(_ sender: Any) {
        createSource(input:5, flag:dotFlag)
    }
    @IBAction func sixButton(_ sender: Any) {
        createSource(input:6, flag:dotFlag)
    }
    @IBAction func sevenButton(_ sender: Any) {
        createSource(input:7, flag:dotFlag)
    }
    @IBAction func eightButton(_ sender: Any) {
        createSource(input:8, flag:dotFlag)
    }
    @IBAction func nineButton(_ sender: Any) {
        createSource(input:9, flag:dotFlag)
    }
    @IBAction func equalButton(_ sender: Any) {
        calcuate(src:calculateSource,dst:calculateDestination,ope:inputOperator)
    }
    @IBAction func dotButton(_ sender: Any) {
        dotFlag = true
    }
    @IBAction func plusButton(_ sender: Any) {
        inputOperator = "+"
        translateSourceToDestination(input:inputOperator)
    }
    @IBAction func minusButton(_ sender: Any) {
        inputOperator = "-"
        translateSourceToDestination(input:inputOperator)
    }
    @IBAction func multipliedButton(_ sender: Any) {
        inputOperator = "*"
        translateSourceToDestination(input:inputOperator)
    }
    @IBAction func devidedButton(_ sender: Any) {
        inputOperator = "/"
        translateSourceToDestination(input:inputOperator)
    }
    @IBAction func allClearButton(_ sender: Any) {
        allClearStates()
    }
    func createSource(input:Int, flag:Bool){
        if(flag == false){
            createInteger(inputNum:input)
        }
        else{
            createDecimalSoruce(inputNum:input)
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
    
    //ボタンから入力された値を文字列変換して表示する機能(整数)
    func createInteger(inputNum:Int){
        //print("Nomal:\(calculateSource)*10+\(inputNumber):\(dotFlag)")
        countDigit += 1
        calculateSource = calculateSource * 10.0 + Double(inputNum)
        print(calculateSource)
        indicateText(src:String(calculateSource), rst:String(calculateResult))
    }
    //ボタンから入力された値を文字列変換して表示する機能(小数)
    func createDecimalSoruce(inputNum:Int){
        //print("Decimal:\(calculateSource)+\(inputNumber)/10:\(dotFlag)")
        countDecimalDigit += 1
        calculateSource = calculateSource + Double(inputNum) / (pow(10.0, Double(countDecimalDigit)))
        print(calculateSource)
        formulaText = String(calculateSource)
        indicateText(src:String(calculateSource), rst:String(calculateResult))    }
    //オールクリアー機能
    func allClearStates(){
        calculateSource = 0
        calculateDestination = 0
        countDigit = 0
        countDecimalDigit = 0
        inputOperator = ""
        formulaText = ""
        resultText = ""
        dotFlag = false
        indicateText(src:"", ope:"", dst:"", rst:"")
    }
    //足す数⇨足される数の機能(演算子キー押下時に呼び出される関数)
    func translateSourceToDestination(input:String) {
        inputOperator = input
        calculateDestination = calculateSource
        calculateSource = 0
        countDigit = 0
        countDecimalDigit = 0
        dotFlag = false
        indicateText(dst:String(calculateDestination), rst:String(calculateResult))
        print("dst:\(calculateDestination),src:\(calculateSource),ope:\(inputOperator)")
    }
    //計算機能
    func calcuate(src:Double,dst:Double,ope:String){
        switch ope {
        case "+":
            calculateResult = dst + src
        case "-":
            calculateResult = dst - src
        case "*":
            calculateResult = dst * src
        case "/":
            if(dst != 0){
                calculateResult = dst / src
            }
            else{
                print("0除算エラー")
                allClearStates()
            }
        default:
            print("演算子入ってないよ")
            //break
        }
        indicateText(src:String(calculateSource), ope:String(inputOperator), dst:String(calculateDestination), rst: String(calculateResult))
        calculateSource = calculateResult
        calculateDestination = 0.0
        print("結果：\(dst)\(ope)\(src)=\(calculateResult)")
        print("状況：dst=\(calculateDestination),ope=\(inputOperator),src=\(calculateSource)")
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

