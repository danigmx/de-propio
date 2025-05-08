import MapKit
import SwiftUI

struct MapView: View {
    let cameraPosition: MapCameraPosition = .region(
        .init(
            center: .pilar,
            latitudinalMeters: .defaultLatitudinalMeters,
            longitudinalMeters: .defaultLongitudinalMeters
        )
    )
    let locationManager = CLLocationManager()

    var body: some View {
        Map(initialPosition: cameraPosition) {
            UserAnnotation()
        }
        .mapControls {
            MapCompass()
            MapUserLocationButton()
            MapScaleView()
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
        .mapStyle(.standard(elevation: .flat, pointsOfInterest: .excludingAll))
    }
}

extension CLLocationCoordinate2D {
    static let pilar = CLLocationCoordinate2D(
        latitude: 41.65698058240794,
        longitude: -0.8785106569785741
    )
}

extension CLLocationDistance {
    static let defaultLatitudinalMeters: CLLocationDistance = 400
    static let defaultLongitudinalMeters: CLLocationDistance = 400
}

#Preview {
    MapView()
}
