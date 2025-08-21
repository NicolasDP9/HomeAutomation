// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Actifs
  internal static let active = L10n.tr("Localizable", "active", fallback: "Actifs")
  /// Adresse
  internal static let address = L10n.tr("Localizable", "address", fallback: "Adresse")
  /// Ajustez la température souhaitée
  internal static let adjustDesiredTemperature = L10n.tr("Localizable", "adjust_desired_temperature", fallback: "Ajustez la température souhaitée")
  /// Disponibilité
  internal static let availability = L10n.tr("Localizable", "availability", fallback: "Disponibilité")
  /// Disponible
  internal static let available = L10n.tr("Localizable", "available", fallback: "Disponible")
  /// Fermé
  internal static let closed = L10n.tr("Localizable", "closed", fallback: "Fermé")
  /// Type de contrôleur
  internal static let controllerType = L10n.tr("Localizable", "controller_type", fallback: "Type de contrôleur")
  /// Error messages
  internal static func couldntFindFile(_ p1: Any) -> String {
    return L10n.tr("Localizable", "couldnt_find_file", String(describing: p1), fallback: "Couldn't find %@ in main bundle.")
  }
  /// Couldn't load %@ from main bundle:
  /// %@
  internal static func couldntLoadFile(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "couldnt_load_file", String(describing: p1), String(describing: p2), fallback: "Couldn't load %@ from main bundle:\n%@")
  }
  /// Couldn't parse %@ as %@:
  /// %@
  internal static func couldntParseFile(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
    return L10n.tr("Localizable", "couldnt_parse_file", String(describing: p1), String(describing: p2), String(describing: p3), fallback: "Couldn't parse %@ as %@:\n%@")
  }
  /// Shutter Controls
  internal static let currentPosition = L10n.tr("Localizable", "current_position", fallback: "Position actuelle")
  /// Heating Controls
  internal static let currentTemperature = L10n.tr("Localizable", "current_temperature", fallback: "Température actuelle")
  /// %d°
  internal static func degreeSymbol(_ p1: Int) -> String {
    return L10n.tr("Localizable", "degree_symbol", p1, fallback: "%d°")
  }
  /// Device class: %@
  internal static func deviceClass(_ p1: Any) -> String {
    return L10n.tr("Localizable", "device_class", String(describing: p1), fallback: "Device class: %@")
  }
  /// Device Info
  internal static let deviceInfo = L10n.tr("Localizable", "device_info", fallback: "Device Info")
  /// Device Type Not Supported
  internal static let deviceTypeNotSupported = L10n.tr("Localizable", "device_type_not_supported", fallback: "Device Type Not Supported")
  /// Device Url
  internal static let deviceUrl = L10n.tr("Localizable", "device_url", fallback: "Device Url")
  /// File names
  internal static let devicesJson = L10n.tr("Localizable", "devices_json", fallback: "devices.json")
  /// Navigation
  internal static let devicesTab = L10n.tr("Localizable", "devices_tab", fallback: "Devices")
  /// Désactivé
  internal static let disabled = L10n.tr("Localizable", "disabled", fallback: "Désactivé")
  /// Email
  internal static let email = L10n.tr("Localizable", "email", fallback: "Email")
  /// Activé
  internal static let enabled = L10n.tr("Localizable", "enabled", fallback: "Activé")
  /// Informations de l'équipement
  internal static let equipmentInformation = L10n.tr("Localizable", "equipment_information", fallback: "Informations de l'équipement")
  /// Device Information
  internal static let equipmentName = L10n.tr("Localizable", "equipment_name", fallback: "Nom de l'équipement")
  /// État de l'équipement
  internal static let equipmentState = L10n.tr("Localizable", "equipment_state", fallback: "État de l'équipement")
  /// Prénom
  internal static let firstName = L10n.tr("Localizable", "first_name", fallback: "Prénom")
  /// gear
  internal static let gear = L10n.tr("Localizable", "gear", fallback: "gear")
  /// HeatingSystem
  internal static let heatingSystem = L10n.tr("Localizable", "heating_system", fallback: "HeatingSystem")
  /// Système de chauffage actif
  internal static let heatingSystemActive = L10n.tr("Localizable", "heating_system_active", fallback: "Système de chauffage actif")
  /// Système de chauffage
  internal static let heatingSystems = L10n.tr("Localizable", "heating_systems", fallback: "Système de chauffage")
  /// Désactivé
  internal static let inactive = L10n.tr("Localizable", "inactive", fallback: "Désactivé")
  /// Label
  internal static let label = L10n.tr("Localizable", "label", fallback: "Label")
  /// Nom
  internal static let lastName = L10n.tr("Localizable", "last_name", fallback: "Nom")
  /// Device Status
  internal static let loadingEquipments = L10n.tr("Localizable", "loading_equipments", fallback: "Chargement des équipements...")
  /// Adresse principale
  internal static let mainAddress = L10n.tr("Localizable", "main_address", fallback: "Adresse principale")
  /// Membre depuis %@
  internal static func memberSince(_ p1: Any) -> String {
    return L10n.tr("Localizable", "member_since", String(describing: p1), fallback: "Membre depuis %@")
  }
  /// Mon compte
  internal static let myAccount = L10n.tr("Localizable", "my_account", fallback: "Mon compte")
  /// My account
  internal static let myAccountTab = L10n.tr("Localizable", "my_account_tab", fallback: "My account")
  /// Mes équipements
  internal static let myEquipments = L10n.tr("Localizable", "my_equipments", fallback: "Mes équipements")
  /// Common
  internal static let na = L10n.tr("Localizable", "N/A", fallback: "N/A")
  /// Adresse réseau
  internal static let networkAddress = L10n.tr("Localizable", "network_address", fallback: "Adresse réseau")
  /// Ouvert
  internal static let `open` = L10n.tr("Localizable", "open", fallback: "Ouvert")
  /// %d%% d'ouverture
  internal static func openingPercentage(_ p1: Int) -> String {
    return L10n.tr("Localizable", "opening_percentage", p1, fallback: "%d%% d'ouverture")
  }
  /// Vue d'ensemble
  internal static let overview = L10n.tr("Localizable", "overview", fallback: "Vue d'ensemble")
  /// Partiellement ouvert
  internal static let partiallyOpen = L10n.tr("Localizable", "partially_open", fallback: "Partiellement ouvert")
  /// %d%%
  internal static func percentage(_ p1: Int) -> String {
    return L10n.tr("Localizable", "percentage", p1, fallback: "%d%%")
  }
  /// User Account
  internal static let personalInformation = L10n.tr("Localizable", "personal_information", fallback: "Informations personnelles")
  /// Contrôle de position
  internal static let positionControl = L10n.tr("Localizable", "position_control", fallback: "Contrôle de position")
  /// power
  internal static let power = L10n.tr("Localizable", "power", fallback: "power")
  /// Positions rapides
  internal static let quickPositions = L10n.tr("Localizable", "quick_positions", fallback: "Positions rapides")
  /// Températures rapides
  internal static let quickTemperatures = L10n.tr("Localizable", "quick_temperatures", fallback: "Températures rapides")
  /// Device Types
  internal static let rollerShutter = L10n.tr("Localizable", "roller_shutter", fallback: "RollerShutter")
  /// Volets roulants
  internal static let rollerShutters = L10n.tr("Localizable", "roller_shutters", fallback: "Volets roulants")
  /// Glissez verticalement pour ajuster
  internal static let slideVerticallyToAdjust = L10n.tr("Localizable", "slide_vertically_to_adjust", fallback: "Glissez verticalement pour ajuster")
  /// Status
  internal static let status = L10n.tr("Localizable", "status", fallback: "Status")
  /// Système arrêté
  internal static let systemStopped = L10n.tr("Localizable", "system_stopped", fallback: "Système arrêté")
  /// Température cible
  internal static let targetTemperature = L10n.tr("Localizable", "target_temperature", fallback: "Température cible")
  /// Temperature and Values
  internal static func temperatureCelsius(_ p1: Float) -> String {
    return L10n.tr("Localizable", "temperature_celsius", p1, fallback: "%.1f°C")
  }
  /// Contrôle de température
  internal static let temperatureControl = L10n.tr("Localizable", "temperature_control", fallback: "Contrôle de température")
  /// Total
  internal static let total = L10n.tr("Localizable", "total", fallback: "Total")
  /// Type
  internal static let type = L10n.tr("Localizable", "type", fallback: "Type")
  /// Types
  internal static let types = L10n.tr("Localizable", "types", fallback: "Types")
  /// Indisponible
  internal static let unavailable = L10n.tr("Localizable", "unavailable", fallback: "Indisponible")
  /// Unsupported Device
  internal static let unsupportedDevice = L10n.tr("Localizable", "unsupported_device", fallback: "Unsupported Device")
  /// user.json
  internal static let userJson = L10n.tr("Localizable", "user_json", fallback: "user.json")
  /// Contrôle vertical
  internal static let verticalControl = L10n.tr("Localizable", "vertical_control", fallback: "Contrôle vertical")
  internal enum Exclamationmark {
    /// exclamationmark.triangle
    internal static let triangle = L10n.tr("Localizable", "exclamationmark.triangle", fallback: "exclamationmark.triangle")
  }
  internal enum House {
    /// System Icons - keeping as is since they are system identifiers
    internal static let fill = L10n.tr("Localizable", "house.fill", fallback: "house.fill")
  }
  internal enum Person {
    internal enum Crop {
      internal enum Circle {
        /// person.crop.circle.fill
        internal static let fill = L10n.tr("Localizable", "person.crop.circle.fill", fallback: "person.crop.circle.fill")
      }
    }
  }
  internal enum Square {
    internal enum Grid {
      internal enum _2x2 {
        /// square.grid.2x2.fill
        internal static let fill = L10n.tr("Localizable", "square.grid.2x2.fill", fallback: "square.grid.2x2.fill")
      }
    }
  }
  internal enum Thermometer {
    /// thermometer.medium
    internal static let medium = L10n.tr("Localizable", "thermometer.medium", fallback: "thermometer.medium")
  }
  internal enum Window {
    internal enum Shade {
      /// window.shade.closed
      internal static let closed = L10n.tr("Localizable", "window.shade.closed", fallback: "window.shade.closed")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
