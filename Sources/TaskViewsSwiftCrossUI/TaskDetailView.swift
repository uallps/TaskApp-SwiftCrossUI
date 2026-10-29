import SwiftCrossUI
import TaskCore

/// SwiftCrossUI no tiene `Form` ni `.navigationTitle` y la pila no añade un
/// botón de volver: la vista recibe una acción para volver.
struct TaskDetailView: View {
    @Binding var task: Task
    let close: () -> Void

    var body: some View {
        VStack {
            Text(task.title)
                .font(.title)
            TextField("Título de la tarea", text: $task.title)
            Button("Volver") {
                close()
            }
        }
        .padding()
    }
}
