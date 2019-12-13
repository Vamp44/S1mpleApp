//
//  ViewController.swift
//  S1mpleApp
//
//  Created by s2018 on 2019/11/29.
//  Copyright © 2019 s2018. All rights reserved.
//

import UIKit
let questions1:[String] = ["1.在if语句的三种形式中，如果要想在满足条件时执行一组(多个)语句，则必须把这一组语句用{}括起来组成一个复合语句。","2.任何表达式语句都是表达式加分号组成的。","3.do-while循环的while后的分号可以省略。","4.case语句后如没有break，顺序向下执行。","5.增1减1运算符的前缀运算和后缀运算的表达式值是相同的。","6.函数的实参可以是常量，变量或表达式。","7.如果函数定义出现在函数调用之前，可以不必加函数原型声明。","8.C 语言程序中可以有多个函数 , 但只能有一个主函数。","9.函数返回值的类型是由在定义函数时所指定的函数类型。","10.局部变量如果没有指定初值，则其初值不确定。","11.若有定义int a[]={2,4,6,8,10},p=a;a的值是数组首地址，则*(p+1)的值是4。","12.指针数组的每个元素都是一个指针变量。","13.关于C语言指针的运算：指针只有加减操作，没有乘除操作。指针可以加常数、减常数；相同类型的指针可以相加、相减。","14.假设有定义如下： int array[10]; 则该语句定义了一个数组array。其中array的类型是整型指针（即： int *）。","15.C语言具有简洁明了的特点"]
//T T F T F T T T T T T T F F T

var answer1:[Bool] = [true,true,false,true,false,true,true,true,true,true,true,true,false,false,true]
let questions2:[String] = ["1、中国近代睁眼看世界的第一人是林则徐。",
"2、鸦片战争是林则徐虎门销烟引起的。",
"3、三元里人民的抗英斗争，是中国近代史上中国人民第一次大规模的反侵略武装斗争。",
"4、林则徐提出了“师夷长技以制夷”的思想，主张学习外国先进的军事和科学技术。",
"5、最能体现太平天国社会理想和这次农民起义特色的纲领性文件是《天朝田亩制度》。",
"6、20世纪初，清政府已经完全变成帝国主义统治中国的工具，最能说明这一点的是严禁中国人民反帝。",
"7、成立于1898年的京师大学堂是清华大学的前身。",
"8、1894年，孙中山在檀香山创立了中国第一个资产阶级革命团体同盟会。",
"9、同盟会成立后，资产阶级革命派发动了一系列武装起义，其中影响最大的是七女湖起义。",
"10、三民主义是指民族主义、民权主义、民生主义。",
"11、1915年，蔡锷等在云南组织“护国军”，宣布独立，很快形成席卷半个中国的护国运动。",
"12、《天演论》的作者是严复。",
"13、新文化运动在宣传民主、科学的同时，提出必须反对封建的伦理道德。",
"14、中国最早接受和宣传马克思主义的先进分子是毛泽东。",
"15、五四运动的直接导火线是北洋军阀政府的黑暗统治。"]
//TFTFTFFFFTTFTFF
var answer2:[Bool] = [true,false,true,false,true,false,false,false,false,true,true,false,true,false,false]
var questions:[String] = questions1
var answer:[Bool] = answer1
var Tag:Bool = true
var T:Bool = true
var count:Int = 0
var wide:Int = 0
var score:Double = 0
var x:Float = 0
class ViewController: UIViewController {
    
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var cutt: UIButton!
    
    @IBAction func add(_ sender: Any) {
        x += 0.0625
        progressView.setProgress(x, animated: true)
        if(T){
            add.setTitle("Yes", for: .normal)
            add.backgroundColor = .systemGreen
            cutt.setTitle("No", for: .normal)
            cutt.backgroundColor = .systemRed
            scoreLabel.text = "Score:\(Int(score))"
            ques.text = questions[count]
            quesLabel.text = "\(count + 1)/15"
            T = false
        }
        else{
        if(count < 15){
            Tag = true
            if(Tag == answer[count]){
                count += 1
                score += 10
            }
            else{
                let alert = UIAlertController(title: "提示", message: "答案错误", preferredStyle: UIAlertController.Style.alert)
                present(alert,animated: true,completion: nil)
                presentedViewController?.dismiss(animated: true, completion: nil)
                count += 1
            }
            if(count < 15){
              ques.text = questions[count]
            }
            quesLabel.text = "\(count + 1)/15"
            scoreLabel.text = "Score:\(Int(score))"
        }
        if(count == 15){
            ques.text = "Final Score: " + String(score)
            add.setTitle("Normal", for: .normal)
            add.backgroundColor = .systemOrange
            cutt.setTitle("Abnormal", for: .normal)
            cutt.backgroundColor = .systemOrange
            quesLabel.text = "\(count)/15"
            scoreLabel.text = "Score:\(Int(score))"
            count = 0
            score = 0
            x = 0
            T = true
        }
        }
    }
    @IBAction func cutt(_ sender: Any) {
        x += 0.0625
        progressView.setProgress(x, animated: true)
        if(T){
            add.setTitle("Yes", for: .normal)
            add.backgroundColor = .systemGreen
            cutt.setTitle("No", for: .normal)
            cutt.backgroundColor = .systemRed
            scoreLabel.text = "Score:\(Int(score))"
            while count < 15 {
                questions[count] = questions2[count]
                count += 1
            }
            count = 0
            ques.text = questions[count]
            quesLabel.text = "\(count + 1)/15"
            T = false
        }
        else{
        if(count < 15){
            Tag = false
            if(Tag == answer[count]){
                count += 1
                score += 10
            }
            else{
                let alert = UIAlertController(title: "提示", message: "答案错误", preferredStyle: UIAlertController.Style.alert)
                present(alert,animated: true,completion: nil)
                presentedViewController?.dismiss(animated: true, completion: nil)
                count += 1
            }
            if(count < 15){
              ques.text = questions[count]
            }
            quesLabel.text = "\(count + 1)/15"
            scoreLabel.text = "Score:\(Int(score))"
        }
        if(count == 15){
            ques.text = "Final Score: " + String(score)
            add.setTitle("Normal", for: .normal)
            add.backgroundColor = .systemOrange
            cutt.setTitle("Abnormal", for: .normal)
            cutt.backgroundColor = .systemOrange
            quesLabel.text = "\(count)/15"
            scoreLabel.text = "Score:\(Int(score))"
            count = 0
            score = 0
            x = 0
            T = true
        }
        }
    }
    @IBOutlet weak var ques: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var quesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

