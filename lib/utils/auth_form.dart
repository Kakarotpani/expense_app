import 'package:flutter/material.dart';

final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

// class AuthForm extends StatelessWidget {
//   const AuthForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Text(
//           'Phone Number',
//           style: kLabelStyle,
//         ),
//         const SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             controller: phoneColntroller,
//             keyboardType: TextInputType.emailAddress,
//             style: const TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.phone_android_outlined,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your phone number',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//         const Text(
//           'Password',
//           style: kLabelStyle,
//         ),
//         const SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextField(
//             controller: passwordColntroller,
//             obscureText: true,
//             style: const TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Password',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(   
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(8),
      child: SingleChildScrollView(       
        child: Form(
          key: authFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                labelText: "phone",                    
                icon: Icon(Icons.phone, color: Colors.black),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'phone number required';
                  }
                  else if(value.length<10)
                  {
                    return 'phone number can\'t be less than 10 ';
                  }
                  return null;                        
                },
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,                      
                decoration: const InputDecoration(                        
                  labelText: "password", 
                  icon: Icon(Icons.lock, color: Colors.black),                  
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Password is required';
                  }
                  else if(value.length<8)
                  {
                    return 'Password must have atleast 8';
                    //and atmost 16 characters
                  }
                  else if(value.length>16)
                  {
                    return 'Password must be within 16 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
        ) 
      ),
    );
  }
}