# TaskApp

Aplicación de ejemplo de la asignatura de Líneas de Productos Software. Un único
paquete SwiftPM del que salen varios productos.

## Estructura

```
Sources/
├── TaskCore/              Modelo, ViewModel y AppConfig (Swift puro, sin interfaz)
├── TaskViewsSwiftUI/      Vistas de la versión SwiftUI
├── TaskViewsSwiftCrossUI/ Vistas de la versión SwiftCrossUI
├── TaskUI/                Fachada: reexporta el framework y las vistas de la versión elegida
└── TaskApp/               @main: solo conoce la API pública (TaskListView())
```

La lógica (modelo, ViewModel, flags) se escribe una vez en `TaskCore`. Las vistas se
escriben en SwiftUI siguiendo el código del curso anterior y, *cuando SwiftCrossUI no
soporta algo*, su carpeta tiene una vista propia con la misma API pública. No hay `#if`
entre versiones; el único es el de la fachada `TaskUI`.

## Ejecutar

```sh
swift run                                      # SwiftUI (trait por defecto)
swift run --traits SwiftCrossUI                # SwiftCrossUI
swift run --traits SwiftUI,Prioridades         # SwiftUI con la característica Prioridades
swift run --traits SwiftCrossUI,Prioridades    # SwiftCrossUI con la característica Prioridades
```

`--traits` *reemplaza* a los traits por defecto: hay que listar todos los del producto.
Para compilar sin ejecutar, usar `swift build --product TaskApp`: un `swift build` sin
`--product` compila también la carpeta de la otra versión y falla.

## Qué no soporta SwiftCrossUI 0.10.0 y qué se hace

| SwiftUI | SwiftCrossUI |
|---|---|
| `Image(systemName:)` | Carácter en un botón (`●` / `○`) |
| `.strikethrough` | Texto en gris y cursiva |
| `Color.secondary` | `Color.gray` |
| `Form`, `.navigationTitle` | `VStack` y un `Text` con el título |
| `NavigationStack` sin ruta, botón de volver | `NavigationStack(path:)`, `NavigationLink(..., path:)` y un botón "Volver" |

## Etiquetas

| Etiqueta | Contenido |
|---|---|
| `sesion-3` | Model, View y ViewModel con SwiftUI y `@Observable` |
| `sesion-4` | Paquete con traits, fachada `TaskUI`, fila por versión, feature flags y trait `Prioridades` |
| `sesion-5` | Navegación y detalle como vistas por versión |
