//
//  MyCalenderViewCell.swift
//  calender
//
//  Created by 藤井玖光 on 2022/09/19.
//

import UIKit
import JTAppleCalendar // 1

class MyCalendarViewCell: JTACDayCell {

    @IBOutlet weak var titleLabel: UILabel! // 2

    /// 3 セルの表示の設定をする
    /// ex.ラベルに日にちを入れる
    func configure(cellState: CellState) {
        titleLabel.text = cellState.text
    }
}
