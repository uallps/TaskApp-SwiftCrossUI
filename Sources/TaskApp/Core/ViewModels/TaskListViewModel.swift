import Observation

@Observable
final class TaskListViewModel {
    var tasks: [Task] = [
        Task(title: "Preparar clase"),
        Task(title: "Revisar prácticas"),
        Task(title: "Publicar materiales")
    ]
}
