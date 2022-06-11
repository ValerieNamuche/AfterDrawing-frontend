class CreateProjectDto {
  String title = '';
  String description = '';

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
