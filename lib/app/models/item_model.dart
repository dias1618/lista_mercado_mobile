import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';

class ItemModel{
  
  int? id;
  String? nmProduto;
  int? qtProduto;
  bool? lgProduto;
  
  ListaModel? lista;
  CategoriaModel? categoria;

  ItemModel([this.id, this.nmProduto, this.qtProduto, this.lgProduto, this.lista, this.categoria]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmProduto'] = nmProduto;
    data['qtProduto'] = qtProduto;
    data['lgProduto'] = lgProduto;
    data['lista'] = lista!=null ? lista!.toJson() : null;
    data['categoria'] = categoria!=null ? categoria!.toJson() : null;
    return data;
  }
 
}