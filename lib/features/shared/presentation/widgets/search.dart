import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor:  const Color(0xffD8D8D8).withOpacity(0.3),
        hintText: 'Buscar servicio - zip Dirección',
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff8A8A8A),
        ),
        suffixIcon: Container(
          //Altura maxima del contenedor
            height: 60,
            width: 55,
            decoration: BoxDecoration(
                color: const Color(0xffEF4A9B),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // ignore: deprecated_member_use
              child: SvgPicture.asset('assets/icons/search.svg', color: Colors.white,),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
    );
  }
}
