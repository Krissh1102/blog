class Blog {
  final String title;
  final String imageUrl;
  final String content;

  Blog({required this.title, required this.imageUrl, required this.content});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'],
      imageUrl: json['image_url'],
      content: json['content'],
    );
  }
}
