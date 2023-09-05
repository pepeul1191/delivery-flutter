import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  // stless
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 50,
        ),
        body: Stack(
          children: [
            _backgroundCover(context),
            _boxForm(context),
            _imageUser(),
            _buttonBack(),
            /*Column(children: [
              _imageCover(),
              _textAppName(),
            ]),*/
            //
          ],
        ));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        color: Colors.amber);
  }

  Widget _buttonBack() {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.only(left: 30),
            child: IconButton(
              onPressed: () => {Get.back()},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 35,
              ),
            )));
  }

  Widget _textAppName() {
    return Text('DELIVERY MYSQL',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget _buttonRegister() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Adjust the radius as needed
            )),
            child: Text(
              'REGISTRARSE',
              style: TextStyle(color: Colors.black),
            )));
  }

  Widget _textFieldEmail() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Correo electrónico', prefixIcon: Icon(Icons.email)),
        ));
  }

  Widget _textFieldName() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'Nombre', prefixIcon: Icon(Icons.person)),
        ));
  }

  Widget _textFieldLastName() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'Apellido', prefixIcon: Icon(Icons.person_outline)),
        ));
  }

  Widget _textFieldPhone() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              hintText: 'Teléfono', prefixIcon: Icon(Icons.phone)),
        ));
  }

  Widget _textFieldPassword() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Contraseña',
              prefixIcon: Icon(
                Icons.lock,
              )),
        ));
  }

  Widget _textFieldConfirmPassword() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Confirmar Contraseña',
              prefixIcon: Icon(
                Icons.lock_outlined,
              )),
        ));
  }

  Widget _boxForm(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.55,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.23,
            left: 50,
            right: 50),
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
        ]),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: Text('INGRESA ESTA INFORMACIÓN',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              margin: EdgeInsets.only(top: 40, bottom: 40),
            ),
            _textFieldEmail(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldPhone(),
            _textFieldPassword(),
            _textFieldConfirmPassword(),
            _buttonRegister()
          ],
        )));
  }

  Widget _imageUser() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(top: 30),
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap: () {
            print('XD');
          },
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/img/user_profile.png'),
            radius: 60,
            backgroundColor: Colors.white,
          )),
    ));
  }

  Widget _imageCover() {
    // private method por el _ adelante del método
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Image.asset('assets/img/delivery.png', width: 130, height: 130),
        margin: EdgeInsets.only(top: 50, bottom: 15),
      ),
    );
  }
}
