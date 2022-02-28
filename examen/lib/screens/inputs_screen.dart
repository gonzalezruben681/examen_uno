import 'package:examen/provider/catalogo_provider.dart';
import 'package:flutter/material.dart';
// import 'package:examen/widgets/custom_input_field.dart';
import 'package:provider/provider.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String? _mySelection;
  String? _mySelection2;
  String? _mySelection3;
  String? _mySelection4;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final catalogoProvider = Provider.of<CatalogoProvider>(context);
    setState(() {
      catalogoProvider.cotizar('1', 2, 'Marca');
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cotizar'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  ///Marca
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _mySelection,
                        iconSize: 30,
                        icon: (null),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: const Text('Seleccione un marca'),
                        items: catalogoProvider.onDisplayMarca.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sMarca),
                            value: item.iIdMarca.toString(),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _mySelection = newValue ?? '';
                            print(_mySelection);
                            catalogoProvider.cotizar(
                                _mySelection!, 2, 'Submarca');
                          });
                        },
                      ),
                    ),
                  ),

                  /// Submarca
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _mySelection2,
                        iconSize: 30,
                        icon: (null),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: const Text('Seleccione una submarca'),
                        items: catalogoProvider.onDisplayCatalogo.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sSubMarca),
                            value: item.iIdSubMarca.toString(),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _mySelection2 = newValue ?? '';

                            catalogoProvider.cotizar(
                                _mySelection2!, 2, 'Modelo');
                          });
                        },
                      ),
                    ),
                  ),

                  /// Modelo
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _mySelection3,
                        iconSize: 30,
                        icon: (null),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: const Text('Seleccione una modelo'),
                        items: catalogoProvider.onDisplayModelo.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sModelo),
                            value: item.iIdModelo.toString(),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _mySelection3 = newValue ?? '';
                            print(_mySelection);
                            catalogoProvider.cotizar(
                                _mySelection3!, 2, 'DescripcionModelo');
                          });
                        },
                      ),
                    ),
                  ),

                  /// Descripción
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _mySelection4,
                        iconSize: 30,
                        icon: (null),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: const Text('Seleccione un descripción'),
                        items:
                            catalogoProvider.onDisplayDescripcion.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sDescripcion),
                            value: item.iIdDescripcionModelo.toString(),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _mySelection4 = newValue ?? '';
                            print(catalogoProvider.mySelection);
                          });
                        },
                      ),
                    ),
                  ),

                  Form(
                    key: myFormKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        ElevatedButton(
                          child: const SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('Cotizar'))),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());

                            if (!myFormKey.currentState!.validate()) {
                              print('Formulario no válido');
                              return;
                            }
                           // catalogoProvider.cotizar('1', 2, 'Marca');
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
