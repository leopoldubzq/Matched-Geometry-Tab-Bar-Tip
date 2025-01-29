import SwiftUI

enum TabBarItem: Hashable, CaseIterable {
    case home
    case search
    case orders
    case profile

    var icon: Image {
        switch self {
        case .home:
            return Image(systemName: "house.fill")
        case .search:
            return Image(systemName: "magnifyingglass")
        case .orders:
            return Image(systemName: "list.bullet")
        case .profile:
            return Image(systemName: "person.fill")
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .orders:
            return "Orders"
        case .profile:
            return "Profile"
        }
    }
}
