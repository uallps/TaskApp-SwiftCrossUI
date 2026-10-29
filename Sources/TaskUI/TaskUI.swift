// Quien haga `import TaskUI` recibe el framework de interfaz del trait activo.
#if SwiftCrossUI
@_exported import SwiftCrossUI
@_exported import DefaultBackend
#elseif SwiftUI
@_exported import SwiftUI
#else
#error("Activa un trait de interfaz: SwiftUI o SwiftCrossUI")
#endif
