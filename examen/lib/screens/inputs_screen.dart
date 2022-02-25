import 'package:examen/provider/catalogo_provider.dart';
import 'package:examen/provider/descripcion_provider.dart';
import 'package:examen/provider/modelo_provider.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final catalogoProvider = Provider.of<CatalogoProvider>(context);
    final modeloProvider = Provider.of<ModeloProvider>(context);
    final descripcionProvider = Provider.of<DescripcionProvider>(context);

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
                        value: catalogoProvider.mySelection,
                        iconSize: 30,
                        icon: (null),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: const Text('Seleccione una marca'),
                        items: catalogoProvider.onDisplayCatalogo.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sSubMarca),
                            value: item.iIdSubMarca.toString(),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            catalogoProvider.mySelection = newValue ?? '';
                            print(_mySelection);
                            modeloProvider.cotizar(
                                catalogoProvider.mySelection!, 2, 'Modelo');
                          });
                        },
                      ),
                    ),
                  ),

                  // /// Modelo
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: modeloProvider.mySelection,
                        iconSize: 30,
                        icon: (null),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: const Text('Seleccione una modelo'),
                        items: modeloProvider.onDisplayModelo.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sModelo),
                            value: item.iIdModelo.toString(),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            modeloProvider.mySelection = newValue ?? '';
                            print(_mySelection);
                            descripcionProvider.cotizar(
                                modeloProvider.mySelection!,
                                2,
                                'DescripcionModelo');
                          });
                        },
                      ),
                    ),
                  ),

                  // /// Submarca
                  // DropdownButtonHideUnderline(
                  //   child: ButtonTheme(
                  //     alignedDropdown: true,
                  //     child: DropdownButton<String>(
                  //       value: _mySelection,
                  //       iconSize: 30,
                  //       icon: (null),
                  //       style: const TextStyle(
                  //         color: Colors.black54,
                  //         fontSize: 16,
                  //       ),
                  //       hint: const Text('Seleccione un modelo'),
                  //       items: catalogoProvider.onDisplayCatalogo.map((item) {
                  //         return DropdownMenuItem(
                  //           child: Text(item.sSubMarca),
                  //           value: item.iIdSubMarca.toString(),
                  //         );
                  //       }).toList(),
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           _mySelection = newValue ?? '';
                  //           print(_mySelection);
                  //           catalogoProvider.cotizar(
                  //               _mySelection!, 2, 'DescripcionModelo');
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // /// Descripción
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: descripcionProvider.mySelection,
                        iconSize: 30,
                        icon: (null),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: const Text('Seleccione un descripción'),
                        items: descripcionProvider.onDisplayDescripcion
                            .map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sDescripcion),
                            value: item.iIdDescripcionModelo.toString(),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            descripcionProvider.mySelection = newValue ?? '';
                            print(descripcionProvider.mySelection);
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
                              child: Center(child: Text('Guardar'))),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());

                            if (!myFormKey.currentState!.validate()) {
                              print('Formulario no válido');
                              return;
                            }
                            catalogoProvider.cotizar('19', 2, 'Submarca');
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
