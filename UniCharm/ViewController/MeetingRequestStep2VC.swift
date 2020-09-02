//
//  MeetingRequestStep2VC.swift
//  UniCharm
//
//  Created by Namit Agrawal on 11/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import JTAppleCalendar

class MeetingRequestStep2VC: UIViewController {
    
    @IBOutlet weak var calendarView: JTACMonthView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var weekViewStack: UIStackView!
    
    let formatter = DateFormatter()
    var currentCalendar = Calendar.current
    var prePostVisibility: ((CellState, CellView?)->())?
    var monthSize: MonthSize? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendarView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
        setupScrollMode()
    }
    
    @IBAction func back(_ sender: Any) {
        pop()
    }
    
    @IBAction func book(_ sender: Any) {
        let viewController = StoryboardScene.Main.instantiateViewController(withClass: CheckStatusVC.self)
        self.push(viewController)
     }
}

// MARK: - JTCalendar Methods
extension MeetingRequestStep2VC {
    
    @IBAction func next(_ sender: UIButton) {
        self.calendarView.scrollToSegment(.next)
        self.calendarView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    @IBAction func previous(_ sender: UIButton) {
        self.calendarView.scrollToSegment(.previous)
        self.calendarView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first?.date else {
            return
        }
        let month = currentCalendar.dateComponents([.month], from: startDate).month!
        let monthName = DateFormatter().monthSymbols[(month-1) % 12]
        // 0 indexed array
        let year = currentCalendar.component(.year, from: startDate)
        monthLabel.text = " " +  monthName + " " + String(year) + "     "
    }
    
    func handleCellConfiguration(cell: JTACDayCell?, cellState: CellState) {
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        prePostVisibility?(cellState, cell as? CellView)
    }
    
    // Function to handle the text color of the calendar
    func handleCellTextColor(view: JTACDayCell?, cellState: CellState) {
        guard let myCustomCell = view as? CellView  else {
            return
        }
        
        if cellState.dateBelongsTo == .thisMonth {
            let today = Date()
            let startDate = Calendar.current.date(byAdding: .day, value: -1, to: today)
            let endDate = Calendar.current.date(byAdding: .month, value: 3, to: Date())
            
            if cellState.date.isBetween(startDate!, and: endDate!) {
                if cellState.isSelected {
                    myCustomCell.dayLabel.textColor = .white
                } else {
                    myCustomCell.dayLabel.textColor = .black
                    myCustomCell.backgroundColor = UIColor.white
                }
            } else {
                myCustomCell.dayLabel.textColor = #colorLiteral(red: 0.5019999743, green: 0.5490000248, blue: 0.6079999804, alpha: 1)
                myCustomCell.backgroundColor = UIColor.white
            }
        } else {
            myCustomCell.dayLabel.textColor = #colorLiteral(red: 0.5019999743, green: 0.5490000248, blue: 0.6079999804, alpha: 1)
            myCustomCell.backgroundColor = UIColor.white
        }
    }
    // Function to handle the calendar selection
    func handleCellSelection(view: JTACDayCell?, cellState: CellState) {
        guard let myCustomCell = view as? CellView else {return }
        //        switch cellState.selectedPosition() {
        //        case .full:
        //            myCustomCell.backgroundColor = .green
        //        case .left:
        //            myCustomCell.backgroundColor = .yellow
        //        case .right:
        //            myCustomCell.backgroundColor = .red
        //        case .middle:
        //            myCustomCell.backgroundColor = .blue
        //        case .none:
        //            myCustomCell.backgroundColor = nil
        //        }
        let today = Date()
        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: today)
        let endDate = Calendar.current.date(byAdding: .month, value: 3, to: Date())
        
        if cellState.date.isBetween(startDate!, and: endDate!) {
            if cellState.isSelected {
                myCustomCell.selectedView.layer.cornerRadius =  13
                myCustomCell.selectedView.isHidden = false
            } else {
                myCustomCell.selectedView.isHidden = true
            }
        } else {
            myCustomCell.selectedView.isHidden = true
        }
    }
    
    func setupScrollMode() {
        calendarView.scrollingMode = .stopAtEachSection
    }
}
// MARK: - JTAppleCalendar Delegate and DataSource

extension MeetingRequestStep2VC: JTACMonthViewDataSource, JTACMonthViewDelegate {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        //  let startDate = Date()
        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        let endDate = Calendar.current.date(byAdding: .month, value: 3, to: Date())
        return ConfigurationParameters(startDate: startDate, endDate: endDate!)
    }
    
    func configureVisibleCell(myCustomCell: CellView, cellState: CellState, date: Date, indexPath: IndexPath) {
        myCustomCell.dayLabel.text = cellState.text
        if currentCalendar.isDateInToday(date) {
            myCustomCell.backgroundColor = .white
        } else {
            myCustomCell.backgroundColor = .white
        }
        
   //     myCustomCell.layer.borderWidth = 0.5
   //     myCustomCell.layer.borderColor = #colorLiteral(red: 0.7919999957, green: 0.8199999928, blue: 0.8859999776, alpha: 1).cgColor
        
        handleCellConfiguration(cell: myCustomCell, cellState: cellState)
        
        myCustomCell.monthLabel.text = ""
        //        myCustomCell.monthSecondLabel.text = ""
    }
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // This function should have the same code as the cellForItemAt function
        let myCustomCell = cell as! CellView
        configureVisibleCell(myCustomCell: myCustomCell, cellState: cellState, date: date, indexPath: indexPath)
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let myCustomCell = calendar.dequeueReusableCell(withReuseIdentifier: "CellView", for: indexPath) as! CellView
        configureVisibleCell(myCustomCell: myCustomCell, cellState: cellState, date: date, indexPath: indexPath)
        return myCustomCell
    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        handleCellConfiguration(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        handleCellConfiguration(cell: cell, cellState: cellState)
        
        let today = Date()
        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: today)
        let endDate = Calendar.current.date(byAdding: .month, value: 3, to: Date())
        
        //        if date.isBetween(startDate!, and: endDate!)
        //        {
        //            self.setDateTitle(date)
        //            self.segmentControl.setIndex(1)
        //        }
    }
    
    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        //        print("After: \(calendar.contentOffset.y)")
        
    }
    
    func calendar(_ calendar: JTACMonthView, willScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
    
    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        let date = range.start
        let month = currentCalendar.component(.month, from: date)
        formatter.dateFormat = "MMM"
        let header: JTACMonthReusableView
        if month % 2 > 0 {
            header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "WhiteSectionHeaderView", for: indexPath)
            //   (header as! WhiteSectionHeaderView).title.text = formatter.string(from: date)
        } else {
            header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "PinkSectionHeaderView", for: indexPath)
            //   (header as! PinkSectionHeaderView).title.text = formatter.string(from: date)
        }
        return header
    }
    
    func sizeOfDecorationView(indexPath: IndexPath) -> CGRect {
        let stride = calendarView.frame.width * CGFloat(indexPath.section)
        return CGRect(x: stride + 5, y: 5, width: calendarView.frame.width - 10, height: calendarView.frame.height - 10)
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return monthSize
    }
}
