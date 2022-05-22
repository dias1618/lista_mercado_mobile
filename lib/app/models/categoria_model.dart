class CategoriaModel{
  
  int id;
  String nmCategoria;
  
  CategoriaModel(this.id, this.nmCategoria);

  
  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    print('categoria = ' + json.toString());
    return CategoriaModel(
      (json['id'] ?? 0),
      json['nmCategoria'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmCategoria'] = nmCategoria;
    return data;
  }
  
  static fromJsonArray(List<dynamic> jsonArray) {
    List<CategoriaModel> list = List.empty(growable: true);
    for (var json in jsonArray) {
      list.add(CategoriaModel.fromJson(json));
    }
    return list;
  }
}