import 'package:flutter/material.dart';
import 'package:tareaapi/providers/respuesta_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showResponse(RespuestaProvider respuestaProvider) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (respuestaProvider.mensaje.title.isNotEmpty)
                Text(respuestaProvider.mensaje.title),
              if (respuestaProvider.mensaje.price.isNotEmpty)
                Text(respuestaProvider.mensaje.price),
              if (respuestaProvider.mensaje.description.isNotEmpty)
                Text(respuestaProvider.mensaje.description),
              if (respuestaProvider.mensaje.image.isNotEmpty)
                Image.network(respuestaProvider.mensaje.image),
              if (respuestaProvider.mensaje.category.isNotEmpty)
                Text(respuestaProvider.mensaje.category),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final respuestaProvider = context.watch<RespuestaProvider>();

    return Scaffold(
      appBar: AppBar(
          title: Text('PRODUCTS VARIETY'),
          backgroundColor: Color.fromARGB(255, 91, 218, 102)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1822/1822045.png',
              height: 300.0,
              width: 300.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await respuestaProvider
                    .loadRespuesta(); // Asegúrate de tener esta función en tu provider
                showResponse(respuestaProvider);
              },
              child: Text('Crear Producto'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(
                    255, 248, 224, 2), // Color de fondo del botón
                onPrimary: Colors
                    .black, // Color del texto (asegúrate de que sea visible con el fondo amarillo)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      0), // Puedes ajustar el radio del borde si lo deseas
                  side: BorderSide(
                      color: Colors.black, width: 2), // Borde negro grueso
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
