import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // stless
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 50,
          child: _textDontHaveAccount(),
        ),
        body: Stack(
          children: [
            _backgroundCover(context),
            _boxForm(context),
            Column(children: [
              _imageCover(),
              _textAppName(),
            ]),
            //
          ],
        ));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        color: Colors.amber);
  }

  Widget _textAppName() {
    return Text('DELIVERY MYSQL',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget _buttonLogin() {
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
              'LOGIN',
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

  Widget _boxForm(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.38,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.33,
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
            _textFieldPassword(),
            _buttonLogin()
          ],
        )));
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        SizedBox(width: 7),
        Text(
          'Registrate Aquí',
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ],
    );
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
