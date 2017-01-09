//
//  quiz.swift
//  calculator
//
//  Created by 伊藤孝史 on 2017/01/03.
//  Copyright © 2017年 伊藤孝史. All rights reserved.
//

import Foundation
class quizClass{

    var countMessage = 0//クイズボタン入力時の変数
    var quizFlag:Bool = false
  
    let birthdayQuiz = ["誕生日を当てます！", "誕生月に４を掛けて！", "その答えに9を足して！", "その答えに25を掛けて！" ,"その答えに誕生月を足して！", "その答えから225を引くと・・・", "あなたの誕生日は",""]
    let phoneNumberQuiz = ["電話番号を当てます！", "上4桁を入力して！", "その答えに250をかけて！", "その答えに80をかけて！" ,"その答えに下4桁を足して！", "さらにもう一度下4桁を足すと・・・", "あなたのは電話番号は",""]
    let compatibilityQuiz = ["二人の相性を占います！","あなたの名前を数字に変換し入力して！(子音'a'='1' 'i'='2''u'='3''e'='4' 'o'='5''n'='0')","相手の名前を数字に変換し入力して！(子音'a'='1' 'i'='2''u'='3''e'='4' 'o'='5''n'='0')","二人の相性は・・・",""]

    
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
