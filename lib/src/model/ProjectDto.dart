class ProjectDto {
  int id = 0;
  String title = '';
  String description = '';

  ProjectDto(
      {required this.id, required this.title, required this.description});

  factory ProjectDto.fromJson(Map<String, dynamic> projectJson) {
    return ProjectDto(
        id: projectJson['id'],
        title: projectJson['title'],
        description: projectJson['description']);
  }
}
