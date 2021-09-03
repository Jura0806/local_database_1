import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'home_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static final String id = "account_page";

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void doSignIn(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box2 = Hive.box("SignIn");

    box2.put("name", name);
    box2.put("email", email);
    box2.put("phone", phone);
    box2.put("password", password);

    String uName = box2.get("name");
    String uEmail = box2.get("email");
    String uPhone = box2.get("phone");
    String uPw = box2.get("password");

    print(uName);
    print(uEmail);
    print(uPhone);
    print(uPw);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.indigo.withAlpha(65),
      body: Container(
        padding: EdgeInsets.only(top: 175, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
          Center(child: Text(" Create\nAccount", style: TextStyle(color: Colors.white, fontSize: 30),)),
            SizedBox(height: 40,),
            createSignIn(hintText:" User Name",icon: Icons.person_outline_outlined,controller: nameController),
            createSignIn(hintText:"  E-Mail",icon: Icons.email_outlined,controller: emailController),
            createSignIn(hintText:"  Phone Number",icon: Icons.phone,controller: phoneController ),
            createSignIn(hintText:"  Password",icon: Icons.lock_outline_rounded,controller: passwordController ),
            SizedBox(height: 30,),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade800,
                      Colors.blue.shade700,
                      Colors.blue.shade600,
                      Colors.blue.shade300,
                    ]
                ),
              ),
              child: IconButton(
                onPressed: doSignIn,
                icon: Icon(Icons.arrow_forward_sharp, color: Colors.white,size: 35,),
              ),
            ),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(color: Colors.grey),),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: Text("SIGN IIN", style: TextStyle(color: Colors.blue),),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

  Widget createSignIn({hintText, icon, controller}){
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon( icon, color: Colors.grey,),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                )
            ),
            prefixIconConstraints: BoxConstraints(
                minWidth: 20
            )
        ),
      ),
    );

  }
}
