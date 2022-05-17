import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';

class ItemUsadoViewModelBuilder{

  ItemUsadoViewModel? itemUsadoViewModel;

  ItemUsadoViewModelBuilder(Map<String, dynamic> map){
    itemUsadoViewModel = ItemUsadoViewModel(
      map['id'] ?? 0, 
      map['nmProduto'], 
      map['qtProduto'], 
      map['lgUsado'] ?? false, 
      map['lista']!=null?ListaModel.fromJson(map['lista']):null,
      map['categoria']!=null?CategoriaModel.fromJson(map['categoria']):null);
  }

  ItemUsadoViewModel? build(){
    return itemUsadoViewModel;
  }

}