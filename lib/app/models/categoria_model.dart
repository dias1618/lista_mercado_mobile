class CategoriaModel{
  
  int? id;
  String? nmCategoria;
  
  CategoriaModel([this.id, this.nmCategoria]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmCategoria'] = nmCategoria;
    return data;
  }
}