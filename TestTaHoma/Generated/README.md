# Generated Files

⚠️ **DO NOT EDIT THESE FILES MANUALLY** ⚠️

Ces fichiers sont générés automatiquement par SwiftGen à partir des ressources du projet.

## Structure

```
Generated/
├── L10n.swift          # Strings localisées générées depuis Localizable.strings
├── AssetsCatalog.swift # Assets générés depuis Assets.xcassets  
└── Colors.swift        # Couleurs générées depuis Colors.xcassets
```

## Utilisation

### Strings localisées
```swift
// Avant (strings en dur)
Text("Mes équipements")

// Après (type-safe avec SwiftGen)
Text(L10n.myEquipments)
```

### Icons système
```swift
// Avant
Image(systemName: "house.fill")

// Après  
Image(systemName: L10n.House.fill)
```

### Assets
```swift
// Couleurs personnalisées
Asset.accentColor.swiftUIColor
```

## Régénération

Pour régénérer ces fichiers après modification des ressources :

```bash
cd /path/to/project
swiftgen
```

Ou exécutez le script Build Phase configuré dans Xcode.

## Sources

- **Strings** : `TestTaHoma/Resources/en.lproj/Localizable.strings`
- **Assets** : `TestTaHoma/Assets.xcassets`  
- **Couleurs** : `TestTaHoma/Resources/Colors.xcassets`
- **Configuration** : `swiftgen.yml`