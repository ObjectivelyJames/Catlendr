import SwiftUI
import Kingfisher

struct CalendarCellConstants {
    static let cellSize: CGFloat = 300
    static let cornerRadius: CGFloat = 10
    static let shadowRadius: CGFloat = 5
    static let paddingTrailing: CGFloat = 16
    static let dayOfWeekFont: Font = .title
    static let todayBackgroundColor: Color = .blue
    static let defaultBackgroundColor: Color = .red
    static let todayTextColor: Color = .black
    static let defaultTextColor: Color = .white
    static let dayOfWeekHeight: CGFloat = 50
}

struct CalendarCellView: View {
    var calendarDay: CalendarDay
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    KFImage(URL(string: calendarDay.animal.imageUrl))
                        .placeholder {
                            LoadingView()
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(width: CalendarCellConstants.cellSize, height: CalendarCellConstants.cellSize)
                        .clipped()
                        .cornerRadius(CalendarCellConstants.cornerRadius)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(calendarDay.localizedDayOfWeek)
                                .font(CalendarCellConstants.dayOfWeekFont)
                                .foregroundColor(calendarDay.date.isToday() ? CalendarCellConstants.todayTextColor : CalendarCellConstants.defaultTextColor)
                                .padding(.trailing, CalendarCellConstants.paddingTrailing)
                        }
                        .frame(width: CalendarCellConstants.cellSize, height: CalendarCellConstants.dayOfWeekHeight)
                        .background(calendarDay.date.isToday() ? CalendarCellConstants.todayBackgroundColor : CalendarCellConstants.defaultBackgroundColor)
                        .cornerRadius(CalendarCellConstants.cornerRadius, corners: [.bottomLeft, .bottomRight])
                    }
                    .frame(width: CalendarCellConstants.cellSize, height: CalendarCellConstants.cellSize)
                }
                .frame(width: CalendarCellConstants.cellSize, height: CalendarCellConstants.cellSize)
                .shadow(radius: CalendarCellConstants.shadowRadius)
                Spacer()
            }
            Spacer()
        }
    }
}
