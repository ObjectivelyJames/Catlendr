import SwiftUI

struct CatlendrViewConstants {
    static let navigationTitleCat = "Catlendr"
    static let navigationTitleDog = "Doglendr"
    static let pickerPadding: CGFloat = 16
    static let listRowBackgroundColor: Color = .clear
    static let listRowSeparatorVisibility: Visibility = .hidden
    static let backgroundColor: Color = .white
}

struct CatlendrView: View {
    @StateObject var viewModel = CatlendrViewModel()
    @State private var selectedAnimalType: AnimalType = .cat
    
    private var navigationTitle: String {
        switch selectedAnimalType {
        case .cat:
            return CatlendrViewConstants.navigationTitleCat
        case .dog:
            return CatlendrViewConstants.navigationTitleDog
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Animal", selection: $selectedAnimalType) {
                    Text("🐱").tag(AnimalType.cat)
                    Text("🐶").tag(AnimalType.dog)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(CatlendrViewConstants.pickerPadding)
                
                if viewModel.isLoading {
                    Spacer()
                    LoadingView()
                    Spacer()
                } else {
                    if let error = viewModel.errorMessage {
                        ErrorView(errorMessage: error)
                        Spacer()
                    } else {
                        List(viewModel.calendarDays) { calendarDay in
                            CalendarCellView(calendarDay: calendarDay)
                                .listRowBackground(CatlendrViewConstants.listRowBackgroundColor)
                                .listRowSeparator(CatlendrViewConstants.listRowSeparatorVisibility)
                        }
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationTitle(navigationTitle)
            .onAppear {
                Task {
                    await viewModel.fetchAnimalImages(for: selectedAnimalType)
                }
            }
            .onChange(of: selectedAnimalType) {
                Task {
                    await viewModel.fetchAnimalImages(for: selectedAnimalType)
                }
            }
        }
        .background(CatlendrViewConstants.backgroundColor)
    }
}

#Preview {
    CatlendrView()
}
