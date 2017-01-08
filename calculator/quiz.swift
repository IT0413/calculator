//
//  quiz.swift
//  calculator
//
//  Created by 伊藤孝史 on 2017/01/03.
//  Copyright © 2017年 伊藤孝史. All rights reserved.
//

import Foundation
class quizClass{
    //var VC = ViewController()

    var countMessage = 0//クイズボタン入力時の変数
    var quizFlag:Bool = false
  
    let birthdayQuiz = ["誕生日当てクイズ", "誕生月に４を掛けて！", "その答えに９を足して！", "その答えに２５を掛けて！" ,"その答えに誕生月を足して！", "その答えから２２５を引くと・・・", "誕生日は",""]

    
    //print("button:\(countMessage)")
    func startQuiz(){
        quizFlag = true
    }
    func instructionQuiz(){
        //quizを進める
        if(quizFlag == true){
            //VC.instructionText.text = birthdayQuiz[countMessage]
            //quizの終了確認
            if(birthdayQuiz.count <= countMessage + 1){
                //view.backgroundColor = UIColor.green//何かしら最終結果であることのエフェクトを入れたい
                //VC.instructionText.text = ""
                quizFlag = false
                countMessage = 0
            }
            countMessage += 1
        }
    }
}
