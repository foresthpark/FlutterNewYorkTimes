class Multimedia {
  String caption;
  String copyright;
  String format;
  int height;
  String subtype;
  String type;
  String url;
  int width;

  Multimedia(
      {this.caption,
      this.copyright,
      this.format,
      this.height,
      this.subtype,
      this.type,
      this.url,
      this.width});

  factory Multimedia.fromJson(Map<String, dynamic> json) {
    return Multimedia(
      caption: json['caption'],
      copyright: json['copyright'],
      format: json['format'],
      height: json['height'],
      subtype: json['subtype'],
      type: json['type'],
      url: json['url'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['copyright'] = this.copyright;
    data['format'] = this.format;
    data['height'] = this.height;
    data['subtype'] = this.subtype;
    data['type'] = this.type;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}
