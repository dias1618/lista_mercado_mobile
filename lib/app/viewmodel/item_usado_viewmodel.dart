import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:mobx/mobx.dart';


part 'item_usado_viewmodel.g.dart';

class ItemUsadoViewModel = _ItemUsadoStoreBase with _$ItemUsadoViewModel;
abstract class _ItemUsadoStoreBase extends ItemModel with Store {
  @observable
  bool lgUsado;

  _ItemUsadoStoreBase(int id, String nmProduto, int qtProduto, this.lgUsado, ListaModel? lista, CategoriaModel? categoria) : super(id, nmProduto, qtProduto, lgUsado, lista, categoria);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nmProduto'] = nmProduto;
    data['qtProduto'] = qtProduto;
    data['lgProduto'] = lgProduto;
    data['lgUsado'] = lgUsado;
    if(lista!=null){
      data['lista'] = lista!.toJson();
    }
    if(categoria!=null){
      data['categoria'] = categoria!.toJson();
    }
    return data;
  }
  
}