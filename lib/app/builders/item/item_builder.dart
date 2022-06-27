import 'package:lista_mercado_mobile/app/builders/categoria/categoria_builder.dart';
import 'package:lista_mercado_mobile/app/builders/lista/lista_builder.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';

class ItemBuilder{
  late ItemModel _itemModel;

  ItemBuilder(){
    _itemModel = ItemModel();
  }

  ItemBuilder fromJson(Map<String, dynamic> json){
    _itemModel.id = json['id'] ?? 0;
    _itemModel.nmProduto = json['nmProduto'];
    _itemModel.qtProduto = json['qtProduto'];
    _itemModel.lgProduto = (json['lgProduto']==0 ? false : json['lgProduto']==1 ? true : json['lgProduto'] ?? false);
    _itemModel.lista = json['lista']!=null?ListaBuilder().fromJson(json['lista']).build():null;
    _itemModel.categoria = json['categoria']!=null?CategoriaBuilder().fromJson(json['categoria']).build():null;
    return this;
  }

  ItemModel build(){
    return _itemModel;
  }
}