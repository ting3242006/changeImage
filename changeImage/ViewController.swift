//
//  ViewController.swift
//  changeImage
//
//  Created by Ting on 2021/8/21.
//

import UIKit

class ViewController: UIViewController {
  
    //拉outlet
    @IBOutlet weak var movieImageView: UIImageView!{
        didSet {
            movieImageView.layer.cornerRadius = 30
            movieImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var movieSegment: UISegmentedControl!
    @IBOutlet weak var moviePageControl: UIPageControl!
    @IBOutlet weak var movieLabel: UILabel!
    
    //運用陣列array
    let imageViews = ["actress","blue","godFather"]
    let movieDescriptions = ["以主角藤原千代子一生時緊時鬆的追夢，貫穿演藝人生；而她所演出的每一部電影，全都為其終生的追尋作註解。", "霧越未麻是流行音樂偶像團體「CHAM!」中的成員之一，但是在公司的決策下，未麻告別偶像身分轉往演員發展。但她卻感覺內心有個聲音在拒絕自己的選擇。隨著越來越多電視劇的演出，未麻卻覺得自己的頭腦越來越奇怪，彷彿有「另一個自己」正在形成。這時，她身邊的工作人員竟一個個接連被殺。在面對社會壓力和疑雲之際，未麻感到越來越混亂……", "大雪紛飛的東京，在一個原本應該是全家團圓的聖誕夜裡，流浪漢阿仁、小花和美雪卻在新宿街頭意外撿到一個被遺棄的女嬰。三個看似放棄人生，沒有未來的流浪漢在叢林都市中展開了一段尋人冒險。"]
    
    //顯示陣列排序
    var index:Int = 0
    //function定義同步改變的內容
    func pageChange(){
        movieImageView.image = UIImage(named: imageViews[index])
        movieSegment.selectedSegmentIndex = index
        moviePageControl.currentPage = index
        movieLabel.text = movieDescriptions[index]
    }
    
    //viewDidLoad 預設顯示的內容
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    //Segment Control切換
    @IBAction func selectSegment(_ sender: Any) {
        index = movieSegment.selectedSegmentIndex
        pageChange()
    }
    
    //下一頁
    @IBAction func next(_ sender: Any) {
        if index == imageViews.count-1 {
            index = 0
        }else{
            index += 1
        }
        pageChange()
    }
    //前一頁
    @IBAction func pre(_ sender: Any) {
        if index == 0 {
            index = imageViews.count-1
        }else{
            index -= 1
        }
        pageChange()
        }
    
    //Page Control切換
    @IBAction func changePage(_ sender: Any) {
        index = moviePageControl.currentPage
        pageChange()
    }
    
    //向左、向右滑動翻頁
    @IBAction func SwipeToChange(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            index += 1
            if index == 0 {
                pageChange()
            } else if index == 1 {
                pageChange()
            } else if index == 2 {
                pageChange()
            } else {
                index = 0
                pageChange()
            }
        }else if sender.direction == .right {
            index -= 1
            if index == 2 {
            pageChange()
            } else if index == 1 {
                pageChange()
            } else if index == 0 {
                pageChange()
            } else {
                index = 2
                pageChange()
            }
        }
    }
}



