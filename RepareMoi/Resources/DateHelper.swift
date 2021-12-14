//
//  Date+Helpers.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import Foundation
extension Date {
    
    func descriptiveString(dateStyle: DateFormatter.Style = .short) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date: Date())
        
        if daysBetween == 0 {
            return "Aujourd'hui"
        }
        else if daysBetween == 1 {
            return "Hier"
        }
        else if daysBetween < 5 {
            let weekdayIndex = Calendar.current.component(.weekday, from: self) - 1
            return formatter.weekdaySymbols[weekdayIndex]
        }
        return formatter.string(from: self)
    }
    
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        if let daysBetween = calendar.dateComponents([.day], from: date1, to: date2).day {
            return daysBetween
        }
        return 0
    }
}
