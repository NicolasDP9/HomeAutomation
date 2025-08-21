/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Storage for model data.
*/

import Foundation

@Observable
final class ModelData {
    var devices: [Device] = load(L10n.devicesJson)
    var users: [User] = load(L10n.userJson)
    
    var family: [String: [Device]] {
        Dictionary(
            grouping: devices,
            by: { $0.uiClass }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError(L10n.couldntFindFile(filename))
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(L10n.couldntLoadFile(filename, error))
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(L10n.couldntParseFile(filename, T.self, error))
    }
}

