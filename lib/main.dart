import 'package:flutter/material.dart';

void main() => runApp(const EventosPoplasApp());

class EventosPoplasApp extends StatelessWidget {
  const EventosPoplasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ServiciosPage(),
    );
  }
}

class ServiciosPage extends StatelessWidget {
  const ServiciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo
    final List<Map<String, dynamic>> proveedores = [
      {
        "nombre": "Fotos\nBloom",
        "servicios": "Fotografías profesionales, Sesiones exteriores",
        "imagen": "https://raw.githubusercontent.com/paola-ortega-0301/imagenes-pantalla/refs/heads/main/1.jpg",
      },
      {
        "nombre": "Payasos\nJuárez",
        "servicios": "Payaso Chuponcito, Payasos Duplas, Show de Magia",
        "imagen": "https://raw.githubusercontent.com/paola-ortega-0301/imagenes-pantalla/refs/heads/main/2.jpg",
      },
      {
        "nombre": "Mobiliario\nTilín",
        "servicios": "Renta de mesas, Renta de sillas, Mantelería",
        "imagen": "https://raw.githubusercontent.com/paola-ortega-0301/imagenes-pantalla/refs/heads/main/3.webp",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        toolbarHeight: 100,
        centerTitle: true,
        title: Column(
          children: const [
            Text("EVENTOS", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 4)),
            Text("POPLAS", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 2)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Barra de usuario separada (siguiendo tu estilo)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.deepPurple.shade700,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.person, color: Colors.white, size: 26),
              ],
            ),
          ),
          
          // Contenido principal
          Expanded(
            child: Container(
              color: Colors.purple[50]!.withAlpha(77), // Fondo suave como tu registro
              child: ListView.builder(
                padding: const EdgeInsets.all(24.0),
                itemCount: proveedores.length,
                itemBuilder: (context, index) {
                  final p = proveedores[index];
                  return _buildProveedorItem(
                    nombre: p['nombre'],
                    servicios: p['servicios'],
                    imageUrl: p['imagen'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget que construye cada fila de proveedor con el estilo de tu formulario
  Widget _buildProveedorItem({required String nombre, required String servicios, required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Nombre del proveedor encerrado en un círculo (Estilo sello)
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepPurple.shade300, width: 2),
              boxShadow: [
                BoxShadow(color: Colors.purple.withAlpha(25), blurRadius: 8, offset: const Offset(0, 4)),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
          ),
          
          const SizedBox(width: 16),

          // Cuadro de servicios e imagen (Estilo "InputGroup" de tu registro)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple[100]!),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10, offset: const Offset(0, 5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Texto de servicios
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          servicios,
                          style: TextStyle(color: Colors.grey[700], fontSize: 13, height: 1.4),
                        ),
                      ),
                      // Imagen con recorte igual a tus bordes de input
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(11)),
                        child: Image.network(
                          imageUrl,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}