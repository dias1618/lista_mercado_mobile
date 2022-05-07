import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_mercado_mobile/app/models/item_model.dart';
import 'package:lista_mercado_mobile/app/modules/home/pages/lista/stores/item_store.dart';

class ButtonRemoveItem extends StatefulWidget {

  final ItemModel itemModel;

  const ButtonRemoveItem({ 
    Key? key,
    required this.itemModel
  }) : super(key: key);

  @override
  State<ButtonRemoveItem> createState() => _ButtonRemoveItemState();
}

class _ButtonRemoveItemState extends ModularState<ButtonRemoveItem, ItemStore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: const Icon(Icons.delete_outline),
        onPressed: () {
          store.remove(widget.itemModel);
        }
      ),
    );
  }
}