import SwiftUI

struct LaunchView: View {
    var body: some View {
        return ViewFactory<WeatherView>()
            .build(WeatherView.ViewModel.init)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
