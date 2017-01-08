//
//  CalculateClass.swift
//  calculator
//
//  Created by 伊藤孝史 on 2017/01/09.
//  Copyright © 2017年 伊藤孝史. All rights reserved.
//

import Foundation

class calculateClass{
    //var VC = ViewController()
    var quizmaster = quizClass()

    var dotFlag:Bool = false
    var countDigit:Int = 0//ケタ数(整数)
    var countDecimalDigit:Int = 0//ケタ数(小数)

    //凡例：計算される数 演算子 計算する数 = 計算結果
    var calculateSource:Double = 0.0//計算する数
    var calculateDestination:Double = 0.0 //計算される数
    var inputOperator:String = ""//演算子
    var calculateResult:Double = 0.0//計算結果

    //ボタンから入力された値を文字列変換して表示する機能
    func createSource(input:Int, flag:Bool){
        if(flag == false){
            countDigit += 1
            calculateSource = calculateSource * 10.0 + Double(input)
            print(calculateSource)
            //VC.indicateText(src:String(calculateSource), rst:String(calculateResult))
        }
        else{
            countDecimalDigit += 1
            calculateSource = calculateSource + Double(input) / (pow(10.0, Double(countDecimalDigit)))
            print(calculateSource)
            //VC.formulaText = String(calculateSource)
            //VC.indicateText(src:String(calculateSource), rst:String(calculateResult))
        }
    }
    //足す数⇨足される数の機能(演算子キー押下時に呼び出される関数)
    func translateSourceToDestination(input:String) {
        inputOperator = input
        calculateDestination = calculateSource
        calculateSource = 0
        countDigit = 0
        countDecimalDigit = 0
        dotFlag = false
        //VC.indicateText(dst:String(calculateDestination), rst:String(calculateResult))
    }
    //計算機能
    func calculate(src:Double,dst:Double,ope:String){
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
                //VC.allClearStates()
            }
        default:
            print("演算子入ってないよ")
        }
        //VC.indicateText(src:String(calculateSource), ope:String(inputOperator), dst:String(calculateDestination), rst: String(calculateResult))
        calculateSource = calculateResult
        calculateDestination = 0.0
        
        //print("結果：\(dst)\(ope)\(src)=\(calculateResult)")
        //print("状況：dst=\(calculateDestination),ope=\(inputOperator),src=\(calculateSource)")
    }

}
