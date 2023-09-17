class MusicModel {
  final String? img;
  final String title;
  final String path;
  final int duration;

  MusicModel(
      {this.img,
      required this.title,
      required this.path,
      required this.duration});

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
        img: map['img'],
        title: map['title'] ?? '',
        path: map['path'] ?? '',
        duration: map['duration'] ?? 0);
  }
}
