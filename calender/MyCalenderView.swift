//
//  MyCalenderView.swift
//  calender
//
//  Created by 藤井玖光 on 2022/09/19.
//

import UIKit
import JTAppleCalendar // 1

class MyCalendarView: UIView {

    @IBOutlet var calendarView: JTACMonthView! // 2

    override func awakeFromNib() {
        // 3 delegateとdetasourceの定義
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self

        // 4 MainCalendarCellの登録
        let nibName = UINib(nibName: "MyCalendarViewCell", bundle:nil)
        calendarView.register(nibName, forCellWithReuseIdentifier: "MyCalendarViewCell")

    }
    
    
}

extension MyCalendarView: JTACMonthViewDelegate {
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! MyCalendarViewCell
        cell.configure(cellState: cellState)
    }

    // cellの設定
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableCell(withReuseIdentifier: "MyCalendarViewCell", for: indexPath) as! MyCalendarViewCell
        cell.configure(cellState: cellState)
        return cell
    }
}

extension MyCalendarView: JTACMonthViewDataSource {
    // カレンダー作成に必要なパラメータの設定
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        var current = Calendar.current
        current.locale = Locale(identifier: "ja_JP")
        current.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        let date = Date()

        let startDate = date // 現在
        let endDate = current.date(byAdding: .month,
                                   value: +1,
                                   to: current.startOfDay(for: date)) //1月後

        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate!,
                                                 numberOfRows: 5,
                                                 calendar: current,
                                                 firstDayOfWeek: .sunday)
        return parameters
    }
}

