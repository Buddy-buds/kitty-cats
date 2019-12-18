class FileModel {
  String file;

  FileModel(this.file);

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      FileModel(json['file']);
}
