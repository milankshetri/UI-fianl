import 'package:airfly/core/common/snackbar/my_snackbar.dart';
import 'package:airfly/features/auth/domain/entity/user_entity.dart';
import 'package:airfly/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final fnamecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final ussernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final key = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    const gap = SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: fnamecontroller,
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  }),
                ),
                gap,
                TextFormField(
                  controller: lnamecontroller,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  }),
                ),
                gap,
                TextFormField(
                  controller: phonecontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phoneNo';
                    }
                    return null;
                  }),
                ),
                gap,
                TextFormField(
                  controller: ussernamecontroller,
                  decoration: const InputDecoration(
                    labelText: "UserName",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  }),
                ),
                gap,
                TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  }),
                ),
                gap,
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      var user = UserEntity(
                        fname: fnamecontroller.text,
                        lname: lnamecontroller.text,
                        phone: phonecontroller.text,
                        username: ussernamecontroller.text,
                        password: passwordcontroller.text,
                      );

                      ref
                          .read(authViewModelProvider.notifier)
                          .registerStudent(user);

                      if (authState.error != null) {
                        showSnackBar(
                          message: authState.error.toString(),
                          context: context,
                          color: Colors.red,
                        );
                      } else {
                        showSnackBar(
                          message: 'Registered successfully',
                          context: context,
                        );
                      }
                    }
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   fnamecontroller.dispose();
  //   lnamecontroller.dispose();
  //   passwordcontroller.dispose();
  //   ussernamecontroller.dispose();
  //   passwordcontroller.dispose();
  //   super.dispose();
  // }
}
