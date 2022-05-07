class ItemModel{
  
  int id;
  String nmProduto;
  int qtProduto;
  bool lgProduto;
  
  ItemModel(this.id, this.nmProduto, this.qtProduto, this.lgProduto);

  
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      json['id'] ?? 0,
      json['nmProduto'],
      json['qtProduto'],
      json['lgProduto'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmProduto'] = nmProduto;
    data['qtProduto'] = qtProduto;
    data['lgProduto'] = lgProduto;
    return data;
  }
  
  static fromJsonArray(List<dynamic> jsonArray) {
    List<ItemModel> list = List.empty(growable: true);
    for (var json in jsonArray) {
      list.add(ItemModel.fromJson(json));
    }
    return list;
  }
}