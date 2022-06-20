import 'package:lista_mercado_mobile/app/models/categoria_model.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/models/item_usado_model.dart';
import 'package:lista_mercado_mobile/app/models/lista_model.dart';
import 'package:lista_mercado_mobile/app/repositories/item_repository.dart';
import 'package:lista_mercado_mobile/app/viewmodel/item_usado_viewmodel.dart';

class ItemUsadoViewModelBuilder{

  ItemUsadoViewModel? itemUsadoViewModel;
  final ItemRepository itemRepository = ItemRepository();

  ItemUsadoViewModelBuilder(ItemUsadoModel itemUsado) {
    itemRepository.get(itemUsado.itemId!).then(
      (item) => itemUsadoViewModel = ItemUsadoViewModel(
        item.id, 
        item.nmProduto, 
        item.qtProduto, 
        itemUsado.lgMarcado!, 
        item.lista,
        item.categoria
      )
    );
  }

  ItemUsadoViewModel? build(){
    return itemUsadoViewModel;
  }

}