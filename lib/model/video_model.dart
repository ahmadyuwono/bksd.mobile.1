class ListVideo {
  final List<VideoModel> video;
  ListVideo({required this.video});

  factory ListVideo.fromJson(List<dynamic> parsedJson) {
    List<VideoModel> video = <VideoModel>[];
    video = parsedJson.map((i) => VideoModel.fromJson(i)).toList();

    return ListVideo(video: video);
  }
}

class VideoModel {
  VideoModel({
    required this.id,
    required this.judul,
    required this.url,
    required this.created_at,
  });

  final String id;
  final String judul;
  final String url;
  final String created_at;

  factory VideoModel.fromJson(Map<String, dynamic> object) {
    return VideoModel(
      id: object['id'],
      judul: object['judul'],
      url: object['url'],
      created_at: object['created_at'],
    );
  }
}
