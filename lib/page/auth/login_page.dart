import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toko_buah/bloc/auth/auth_bloc.dart';
import 'package:toko_buah/page/navbar.dart';
import 'package:toko_buah/utils/color_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void logIn(BuildContext context) {
    context.read<AuthLoginBloc>().add(
      OnAuthLogInEvent(username: username.text, password: pass.text),
    );
  }

  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/img/bg_auth.jpg"),
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 76, bottom: 76),
                      child: SvgPicture.asset("assets/svg/logo_warna.svg"),
                    ),
                  ),
                  Text("Logging", style: TextStyle(fontSize: 26)),
                  Text(
                    "Enter your email and password",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 35),
                  TextInput(
                    username: username,
                    label: "Username",
                    type: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  TextInput(
                    username: pass,
                    label: "Password",
                    type: TextInputType.visiblePassword,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                  BlocConsumer<AuthLoginBloc, AuthLoginState>(
                    listener: (context, state) {
                      if (state is AuthLoad) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Navbar()),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (state is! AuthLoading) {
                                logIn(context);
                              }
                            },
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: colorButton,
                                ),
                                height: 67,
                                width: MediaQuery.of(context).size.width,
                                child:
                                    (state is AuthLoading)
                                        ? Text("Loading")
                                        : Text("Log In"),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child:
                                (state is AuthFail)
                                    ? Text(
                                      state.errors.error ?? "",
                                      style: TextStyle(color: Colors.red),
                                    )
                                    : Text(""),
                          ),
                        ],
                      );
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(fontSize: 14),
                      ),
                      TextButton(
                        onPressed:
                            () => Navigator.pushNamed(context, "/register"),
                        child: Text(
                          "Signup",
                          style: TextStyle(color: colorButton, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.username,
    required this.label,
    required this.type,
  });

  final TextEditingController username;
  final String label;
  final TextInputType type;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  // status visible or not
  bool _obscure = true;
  // cek bila keyboar type password maka true, jika bukan maka false
  bool get isPassword => widget.type == TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.username,
      keyboardType: widget.type,
      // jika keyboar type password maka gunakan param _obscure
      // agar bisa sesuai ketika icon maka berubah, namun jika selain password pantek false, alias dilihat
      obscureText: isPassword ? _obscure : false,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: Colors.green),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Saat tidak fokus
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2), // Saat fokus
        ),
        label: Text(widget.label),
        labelStyle: TextStyle(fontSize: 16),
        suffixIcon:
            // cek jika keyboar type password maka munculkan icon mata
            isPassword
                ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  // ketika dikiklik / berubah maka ubah isi variable _obscure = true / false
                  // true untuk di samarkan, false untuk dilihat
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
                : null,
      ),
    );
  }
}
