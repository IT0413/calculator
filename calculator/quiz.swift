//
//  quiz.swift
//  calculator
//
//  Created by 伊藤孝史 on 2017/01/03.
//  Copyright © 2017年 伊藤孝史. All rights reserved.
//

import Foundation
class quizClass{

    var countMessage = 0
    var quizChoice:Int = 0
    var quizFlag:Bool = false
    var multi: [[Int]] = [[1, 2, 3], [9, 8, 7]]
    let quiz:[[String]] = [["あなたの誕生月に４を掛けて！", "その答えに9を足して！", "その答えに25を掛けて！" ,"その答えに誕生月を足して！", "その答えから225を引くと・・・", "あなたの誕生日はこれ！",""],
                           ["電話番号上4桁を入力して！", "その答えに250をかけて！", "その答えに80をかけて！" ,"その答えに下4桁を足して！", "さらにもう一度下4桁を足して","さらに2で割ると", "あなたのは電話番号はこれ！",""],
                           ["あなたの名前を数字に変換し入力して！(子音'a'='1' 'i'='2''u'='3''e'='4' 'o'='5''n'='0')","相手の名前を数字に変換し入力して！(子音'a'='1' 'i'='2''u'='3''e'='4' 'o'='5''n'='0')","二人の相性はこれ！",""]]

    func instructionQuiz(choice:Int){
        //quizを進める
        if(quizFlag == true){
            //quizの終了確認
            //let count = quiz.reduce(choice){$0 + $1.count}
            let count = quiz[quizChoice].count
            if(count <= countMessage + 1){
                print("正解は！")//UI上に表示するように変更する
                allClearQuiz()
            }
            countMessage += 1
        }
    }
    
    //quiz関連の変数のクリア
    func allClearQuiz(){
        quizFlag = false
        quizChoice = 0
        countMessage = 0
    }
}
