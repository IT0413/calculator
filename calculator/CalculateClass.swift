//
//  CalculateClass.swift
//  calculator
//
//  Created by 伊藤孝史 on 2017/01/09.
//  Copyright © 2017年 伊藤孝史. All rights reserved.
//

import Foundation

class calculateClass{

    var dotFlag:Bool = false
    var countDigit:Int = 0//ケタ数(整数)
    var countDecimalDigit:Int = 0//ケタ数(小数)

    //凡例：計算される数 演算子 計算する数 = 計算結果
    var calculateSource:Double = 0.0//計算する数
    var calculateDestination:Double = 0.0 //計算される数
    var inputOperator:String = ""//演算子
    var calculateResult:Double = 0.0//計算結果

    //ボタンから入力された値を文字列変換して表示する機能
    func createSource(input:Int, flag:Bool) -> (source:String, result:String){
        if(flag == false){
            countDigit += 1
            calculateSource = calculateSource * 10.0 + Double(input)
            print(calculateSource)
            return (String(calculateSource), String(calculateResult))
        }
        else{
            countDecimalDigit += 1
            calculateSource = calculateSource + Double(input) / (pow(10.0, Double(countDecimalDigit)))
            print(calculateSource)
            return (String(calculateSource), String(calculateResult))
        }
    }

    //足す数⇨足される数の機能(演算子キー押下時に呼び出される関数)
    func translateSourceToDestination(input:String) -> (destination:String, result:String){
        inputOperator = input
        calculateDestination = calculateSource
        calculateSource = 0
        countDigit = 0
        countDecimalDigit = 0
        dotFlag = false
        return (String(calculateDestination), String(calculateResult))
    }

    //計算機能(未実装；オーバフロー対策)
    func calculate(src:Double,dst:Double,ope:String) -> (source:String, operator:String, destination:String, result:String){
        switch ope {
        case "+":
            calculateResult = dst + src
        case "-":
            calculateResult = dst - src
        case "*":
            calculateResult = dst * src
        case "/":
            if(src != 0){
                calculateResult = dst / src
            }
            else{
                print("0除算エラー")
            }
        default:
            print("演算子入ってないよ")
        }
        calculateSource = calculateResult
        calculateDestination = 0.0
        return (String(src), String(ope), String(dst), String(calculateResult))
    }
}
