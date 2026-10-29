// Quien haga `import TaskUI` recibe el framework de interfaz del trait activo
// y las vistas propias de esa versión (TaskViewsSwiftUI o TaskViewsSwiftCrossUI).
#if SwiftCrossUI
@_exported import SwiftCrossUI
@_exported import DefaultBackend
@_exported import TaskViewsSwiftCrossUI
#elseif SwiftUI
@_exported import SwiftUI
@_exported import TaskViewsSwiftUI
#else
#error("Activa un trait de interfaz: SwiftUI o SwiftCrossUI")
#endif
