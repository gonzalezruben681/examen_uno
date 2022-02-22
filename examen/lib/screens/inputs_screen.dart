import 'package:examen_uno/models/catalogo_model.dart';
import 'package:examen_uno/provider/catalogo_provider.dart';
import 'package:flutter/material.dart';
import 'package:examen_uno/widgets/custom_input_field.dart';
import 'package:provider/provider.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    List<Catalogo> listaCatalogo = [];
    final catalogo = Provider.of<CatalogoProvider>(context);

    final Map<String, String> formValues = {
      'dato1': 'datos',
      'dato2': 'datos',
      'dato3': 'ddatos',
      'dato4': 'datos',
      'dato5': 'datos'
    };
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cotizar'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: myFormKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => catalogo.cotizar('19', 2, 'Submarca'),
                      child: DropdownButtonFormField<String>(
                          value: 'seleccione',
                          items: listaCatalogo.map((item) {
                            return DropdownMenuItem(
                              child: Text(item.sSubMarca),
                              value: item.iIdMostrar.toString(),
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                            formValues['role'] = value ?? 'Admin';
                          }),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                        value: 'dato2',
                        items: listaCatalogo.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.sSubMarca),
                            value: item.iIdMostrar.toString(),
                          );
                        }).toList(),
                        onChanged: (value) {
                          print(value);
                          formValues['role'] = value ?? 'Admin';
                        }),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                        value: 'dato2',
                        items: const [
                          DropdownMenuItem(
                              value: 'dato1', child: Text('datos')),
                          DropdownMenuItem(
                              value: 'datos3', child: Text('datos1')),
                          DropdownMenuItem(
                              value: 'dato2', child: Text('datos2')),
                          DropdownMenuItem(
                              value: 'dato4', child: Text('datos3')),
                        ],
                        onChanged: (value) {
                          print(value);
                          formValues['role'] = value ?? 'Admin';
                        }),
                    const SizedBox(height: 30),
                    CustomInputField(
                        labelText: 'Código Postal',
                        formProperty: 'codigo_postal',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        labelText: 'Estado',
                        formProperty: 'estado',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        labelText: 'Municipio',
                        formProperty: 'municipio',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        labelText: 'Colonia',
                        formProperty: 'colonia',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: const Text('Guardar'))),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());

                        if (!myFormKey.currentState!.validate()) {
                          print('Formulario no válido');
                          return;
                        }
                        //* imprimir valores del formulario
                        print(formValues);
                      },
                    )
                  ],
                ),
              )),
        ));
  }
}
