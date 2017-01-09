//
//  UIView.swift
//  calculator
//
//  Created by 伊藤孝史 on 2017/01/09.
//  Copyright © 2017年 伊藤孝史. All rights reserved.
//

import Foundation

class viewCreatorClass{

    //var calculator = calculateClass()
    //var quizmaster = quizClass()

    //weak var delegate: UIUpdateDelegate?
    
    var formula:String = ""
    var result:String = ""
    //ボタンの入力に合わせて画面上にテキストを表示する機能

    func indicateText(src:String, ope:String, dst:String, rst:String) -> (formula:String, result:String){
        formula = dst + ope + src
        result = rst
        return (formula, result)
    }
    func indicateText(src:String, rst:String) -> (formula:String, result:String){
        formula = src
        result = rst
        return (formula, result)
    }
    func indicateText(dst:String, rst:String) -> (formula:String, result:String){
        formula = dst
        result = rst
        return (formula, result)
    }

}
