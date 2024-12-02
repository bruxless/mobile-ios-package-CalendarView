//
//  Public+WeekdaysView.swift of CalendarView
//
//  Created by Alina Petrovska on 14.11.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

public protocol WeekdaysView: View {
    // MARK: View Customisation
    func createContent() -> AnyView
    func createWeekdayLabel(_ weekday: MWeekday) -> AnyView
}

public extension WeekdaysView {
    func createContent() -> AnyView { createDefaultContent().erased() }
    func createWeekdayLabel(_ weekday: MWeekday) -> AnyView { createDefaultWeekDayLabel(weekday).erased() }
}

private extension WeekdaysView {
    
    func createDefaultContent() -> some View {
        createWeekdaysView().erased()
    }
    
    func createDefaultWeekDayLabel(_ weekday: MWeekday) -> some View {
        DefaultWeekdayLabel(weekday: weekday)
    }
    
}

// MARK: - Helpers
public extension WeekdaysView {
    /// Creates weekdays view using the selected weekday labels. Cannot be overriden.
    func createWeekdaysView() -> some View { HStack(spacing: 0) { ForEach(MWeekday.allCases, id: \.self, content: createWeekdayItem) } }
}
private extension WeekdaysView {
    func createWeekdayItem(_ weekday: MWeekday) -> some View { createWeekdayLabel(weekday).frame(maxWidth: .infinity) }
}

// MARK: - Others
public extension WeekdaysView {
    var body: some View { createContent() }
}
