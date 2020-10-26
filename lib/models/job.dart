class Job {
  Job({
    this.id,
    this.type,
    this.url,
    this.createdAt,
    this.company,
    this.companyUrl,
    this.location,
    this.title,
    this.description,
    this.howToApply,
    this.companyLogo,
  });

  String id;
  String type;
  String url;
  String createdAt;
  String company;
  String companyUrl;
  String location;
  String title;
  String description;
  String howToApply;
  String companyLogo;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        type: json["type"],
        url: json["url"],
        createdAt: json["created_at"],
        company: json["company"],
        companyUrl: json["company_url"],
        location: json["location"],
        title: json["title"],
        description: json["description"],
        howToApply: json["how_to_apply"],
        companyLogo: json["company_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "url": url,
        "created_at": createdAt,
        "company": company,
        "company_url": companyUrl,
        "location": location,
        "title": title,
        "description": description,
        "how_to_apply": howToApply,
        "company_logo": companyLogo,
      };
}
