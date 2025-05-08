import SwiftUI
import MapKit

struct MapView: View {
    let cameraPosition: MapCameraPosition = .region(
        .init(
            center: .pilar,
            latitudinalMeters: .defaultLatitudinalMeters,
            longitudinalMeters: .defaultLongitudinalMeters
        )
    )
    
    var body: some View {
        Map(initialPosition: cameraPosition)
    }
}

extension CLLocationCoordinate2D {
    static let pilar = CLLocationCoordinate2D(latitude: 41.65698058240794, longitude: -0.8785106569785741)
}

extension CLLocationDistance {
    static let defaultLatitudinalMeters: CLLocationDistance = 400
    static let defaultLongitudinalMeters: CLLocationDistance = 400
}


#Preview {
    MapView()
}
