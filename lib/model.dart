class Model {
  final String htmlUrl;
  final int watchersCount;
  final String language;
  final String description;
  final String name;
  final String owner;


  Model(this.htmlUrl, this.language, this.name, this.owner, this.watchersCount,
      this.description);

  static List<Model> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList
        .map((r) => Model(r['url'], r['watchers_count'], r['language'],
            r['description'], r['name'], r['owner']['login']))
        .toList();
  }
}