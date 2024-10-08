import SwiftUI

struct AppEnvironment {
    let container: DIContainer
}

struct DIContainer: EnvironmentKey {
    let gateways: Gateways
    static var defaultValue: Self { DIContainer(gateways: Gateways()) }
}

extension EnvironmentValues {
  var diContainer: DIContainer {
    get { self[DIContainer.self] }
    set { self[DIContainer.self] = newValue }
  }
}

protocol PatternView: View {
    associatedtype ViewModel: ObservableObject
    var viewModel: ViewModel { get }
    init(viewModel: ViewModel)
}

struct ViewFactory<T: PatternView> {
    @Environment(\.diContainer) private var diContainer: DIContainer
    
    func build(_ builder: (DIContainer) -> T.ViewModel) -> T {
        let viewModel = builder(diContainer)
        return T(viewModel: viewModel)
    }
}
