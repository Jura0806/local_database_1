import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_database_1/pages/account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool writing1 = false;
  bool writing2 = false;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin(){
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box("LogIn");

    box.put("user", userName);
    box.put("pw", password);

    String id = box.get("user");
    String pw = box.get("pw");

    print(id);
    print(pw);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.indigo.withAlpha(65),
      body: Container(
        padding: EdgeInsets.only(top: 175, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 50,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical( bottom: Radius.circular(15), top: Radius.elliptical(10, 10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/photo.jpg",),
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text("Welcome Back!", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),),
            SizedBox(height: 10,),
            Text("Sign in to continue", style: TextStyle(color: Colors.grey, fontSize: 17),),
            SizedBox(height: 50,),

           createLogIn(hintText: " User Name", icon:Icons.person_outline_outlined, controller:userNameController, writing: writing1 ),
           createLogIn(hintText: " Password", icon:Icons.lock_outline_rounded, controller:passwordController, writing: writing2 ),

            SizedBox(height: 10,),
            Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
            SizedBox(height: 70,),
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
                onPressed: doLogin,
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
                    Navigator.pushReplacementNamed(context, AccountPage.id);
                  },
                  child: Text("SIGN UP", style: TextStyle(color: Colors.blue),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

   Widget createLogIn({hintText, icon, controller, writing}){
    return  Container(
      margin: EdgeInsets.only(bottom: 25),
      child: TextField(
        style: TextStyle(
            color: Colors.white
        ),
        controller: controller,
        onTap: (){
          setState(() {
            writing = !writing;
          });
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: writing1? Colors.blue: Colors.grey,),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ),
          prefixIconConstraints: BoxConstraints(
              minWidth: 20
          ),
        ),
      ),
    );
   }
}
