// @dart=2.9
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:navarrete/screens/Contactanos.dart';
import 'package:navarrete/screens/HomePage.dart';
import 'package:navarrete/screens/Ubicacion.dart';

void main() => runApp(MyOferta());

class MyOferta extends StatelessWidget {
  const MyOferta({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distribuidora Navarrete',
      initialRoute: '/',
      routes: {
        '/': (context) => PaginaPrincipal(),
        '/ofertas': (context) => Ofertas(),
        '/ubicaion': (context) => MyUbicacion(),
        '/contacto': (context) => Contacto(),
      },
      //Esto es para que cuando no encuentre un ruta te muestre este mensaje
          onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}

//PAGINA OFERTAS
class Ofertas extends StatefulWidget {
  @override
  State<Ofertas> createState() => _OfertasState();
}

class _OfertasState extends State<Ofertas> {
  int _paginaActual = 1;

  List<String> images = [
    "https://static.vecteezy.com/system/resources/previews/007/967/466/original/felices-fiestas-patrias-or-peruvian-independence-day-cartoon-illustration-with-flag-and-cute-people-for-national-holiday-peru-celebration-on-28-july-in-flat-style-background-vector.jpg",
    "https://static.utilex.pe/images/home/main_section/mainbanner-secondary-banner-1C5JRRWY5ARKQI.jpeg",
    "https://uejn.org.ar/sites/default/files/field/image/Flyers%20Campan%CC%83a%20Escolar%202023.png",
    "https://static.vecteezy.com/system/resources/previews/001/237/934/non_2x/back-to-school-banner-with-school-supplies-and-calligraphy-vector.jpg",
  ];


    List<String> imagesmarca = [
    "https://static.vecteezy.com/system/resources/previews/007/967/466/original/felices-fiestas-patrias-or-peruvian-independence-day-cartoon-illustration-with-flag-and-cute-people-for-national-holiday-peru-celebration-on-28-july-in-flat-style-background-vector.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA6B2QRDkkd1F8n2Fvc1qmw4-_WKpfJigEOGgAK0CalFt6RTNkeKdtHoFtJCvT7Vz9lZs&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZ-X8WPRhxMuEmMEu4yI7X1f0_vWTfo8y_ThFZ7bBIFekPH9vMBYuZF4pWYOfiZ9buTI&usqp=CAU",
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://previews.123rf.com/images/druzhinina/druzhinina1707/druzhinina170700214/82769810-fondo-transparente-de-diferentes-%C3%BAtiles-escolares-primer-d%C3%ADa-de-clases-iconos-de-l%C3%ADnea-de-regreso.jpg'
                ),
            fit: BoxFit.cover),
            
      ),
    
      
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Ofertas"),
          automaticallyImplyLeading: false,
          
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: [
            Text(
              'Super Descuento',
              style: GoogleFonts.concertOne(
                  fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              "-----",
              style: TextStyle(color: Colors.transparent),
            ),
            Container(
              child: _swiper(),
            ),
            Center(
              child: Text(
                "PROMO DEL DIA",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Color.fromARGB(255, 185, 8, 8),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image.network(
                "https://online.fliphtml5.com/krahv/umaz/files/large/b22b4fc068a620a7a05c3f15dc279f59.jpg?1671665265",
                width: 140,
                height: 120,
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Center(
              child: Text(
                "Útiles escolares",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Color.fromARGB(255, 185, 8, 8),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image.network(
                "https://http2.mlstatic.com/D_NQ_NP_794680-MCO46650926895_072021-V.jpg",
                width: 140,
                height: 120,
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Center(
              child: Text(
                "Entra al Sorteo ",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Color.fromARGB(255, 185, 8, 8),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image.network(
                "https://www.quieroganar.com.ar/wp-content/uploads/2021/02/ferniplast-2-768x560.jpg",
                width: 250,
                height: 200,
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(0, 0, 0, 0),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Center(
              child: Text(
                "De Vuelta a Clases",
                style: GoogleFonts.concertOne(
                    fontSize: 30,
                    color: Color.fromARGB(255, 185, 8, 8),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                "------------",
                style: GoogleFonts.aBeeZee(color: Colors.transparent),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Colors.redAccent, backgroundColor: Colors.amber),
                child: Text(
                  "VER MÁS",
                  style: GoogleFonts.concertOne(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.red[800]),
                )),
            Center(
              child: Text(
                'Nuevas Promociones',
                style: GoogleFonts.concertOne(
                    fontSize: 45,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "------",
              style: TextStyle(color: Colors.transparent),
            ),
            Container(
              child: _swiper2(),
            ),
          ],
        ),

        //BARRA INFERIOR DE NAVEGACION
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == _paginaActual) {
                 return; // No hacer nada si se selecciona la misma página
                }
            setState(() {
              _paginaActual = index;
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                );
              } else if (index == 1) {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => Ofertas()),
                // );
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyUbicacion()),
                );
              } else if (index == 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Contacto()),
                );
              }
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: "Ofertas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Ubicación",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: "Contacto",
            ),
          ],
        ),
      ),
    );
  }


  //PRIMER CARRUSEL
  Widget _swiper() {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }

//SEGUNDO CARRUSEL
  Widget _swiper2() {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imagesmarca[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: imagesmarca.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
