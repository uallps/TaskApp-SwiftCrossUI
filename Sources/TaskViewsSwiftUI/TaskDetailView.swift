import SwiftUI
import TaskCore

struct TaskDetailView: View {
    @Binding var task: Task

    var body: some View {
        Form {
            TextField("Título de la tarea", text: $task.title)
        }
        .navigationTitle($task.title)
    }
}
