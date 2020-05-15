class Article {
  String status;
  String copyright;
  String section;
  String lastUpdated;
  int numResults;
  List<Results> results;

  Article(
      {this.status,
      this.copyright,
      this.section,
      this.lastUpdated,
      this.numResults,
      this.results});

  Article.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    section = json['section'];
    lastUpdated = json['last_updated'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['section'] = this.section;
    data['last_updated'] = this.lastUpdated;
    data['num_results'] = this.numResults;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String section;
  String subsection;
  String title;
  String abstract;
  String url;
  String uri;
  String byline;
  String itemType;
  String updatedDate;
  String createdDate;
  String publishedDate;
  String materialTypeFacet;
  String kicker;
  List<String> desFacet;
  List<String> orgFacet;
  List<String> perFacet;
  List<String> geoFacet;
  List<Multimedia> multimedia;
  String shortUrl;

  Results(
      {this.section,
      this.subsection,
      this.title,
      this.abstract,
      this.url,
      this.uri,
      this.byline,
      this.itemType,
      this.updatedDate,
      this.createdDate,
      this.publishedDate,
      this.materialTypeFacet,
      this.kicker,
      this.desFacet,
      this.orgFacet,
      this.perFacet,
      this.geoFacet,
      this.multimedia,
      this.shortUrl});

  Results.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    subsection = json['subsection'];
    title = json['title'];
    abstract = json['abstract'];
    url = json['url'];
    uri = json['uri'];
    byline = json['byline'];
    itemType = json['item_type'];
    updatedDate = json['updated_date'];
    createdDate = json['created_date'];
    publishedDate = json['published_date'];
    materialTypeFacet = json['material_type_facet'];
    kicker = json['kicker'];
    desFacet = json['des_facet'].cast<String>();
    orgFacet = json['org_facet'].cast<String>();
    perFacet = json['per_facet'].cast<String>();
    geoFacet = json['geo_facet'].cast<String>();
    if (json['multimedia'] != null) {
      multimedia = new List<Multimedia>();
      json['multimedia'].forEach((v) {
        multimedia.add(new Multimedia.fromJson(v));
      });
    }
    shortUrl = json['short_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['subsection'] = this.subsection;
    data['title'] = this.title;
    data['abstract'] = this.abstract;
    data['url'] = this.url;
    data['uri'] = this.uri;
    data['byline'] = this.byline;
    data['item_type'] = this.itemType;
    data['updated_date'] = this.updatedDate;
    data['created_date'] = this.createdDate;
    data['published_date'] = this.publishedDate;
    data['material_type_facet'] = this.materialTypeFacet;
    data['kicker'] = this.kicker;
    data['des_facet'] = this.desFacet;
    data['org_facet'] = this.orgFacet;
    data['per_facet'] = this.perFacet;
    data['geo_facet'] = this.geoFacet;
    if (this.multimedia != null) {
      data['multimedia'] = this.multimedia.map((v) => v.toJson()).toList();
    }
    data['short_url'] = this.shortUrl;
    return data;
  }
}

class Multimedia {
  String url;
  String format;
  int height;
  int width;
  String type;
  String subtype;
  String caption;
  String copyright;

  Multimedia(
      {this.url,
      this.format,
      this.height,
      this.width,
      this.type,
      this.subtype,
      this.caption,
      this.copyright});

  Multimedia.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['format'] = this.format;
    data['height'] = this.height;
    data['width'] = this.width;
    data['type'] = this.type;
    data['subtype'] = this.subtype;
    data['caption'] = this.caption;
    data['copyright'] = this.copyright;
    return data;
  }
}
