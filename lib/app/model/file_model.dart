class FileModel {
  late final List<String> files;
  late final String folder;

  //FileModel(this.files = const [], this.folder);
  FileModel()
      : files = [],
        folder = '';

  FileModel.fromJson(
    Map<String, dynamic> json,
  ) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }
}
