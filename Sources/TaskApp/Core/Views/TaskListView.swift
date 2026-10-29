import SwiftUI

struct TaskListView: View {
    let tasks = [
        Task(title: "Preparar clase"),
        Task(title: "Revisar prácticas"),
        Task(title: "Publicar materiales")
    ]

    var body: some View {
        List(tasks) { task in
            Text(task.title)
        }
    }
}
