class Article {
  String title;
  String byline;
  String url;
  String imageUrl;
  String publishedDate;
  String summary;

  Article(
      {this.title,
      this.byline,
      this.url,
      this.imageUrl,
      this.publishedDate,
      this.summary});

  Article.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    byline = json['byline'];
    url = json['url'];
    imageUrl = json['multimedia'].length > 0
        ? json['multimedia'][3]['url']
        : 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
    publishedDate = json['publishedDate'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['byline'] = this.byline;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['publishedDate'] = this.publishedDate;
    data['summary'] = this.summary;
    return data;
  }
}
