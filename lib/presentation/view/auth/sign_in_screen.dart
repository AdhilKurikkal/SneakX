import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/domain/providers/auth_provider.dart';
import 'package:sneakx/presentation/widget/custom_textfield.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  String? error;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => error = null);
    try {
      await ref
          .read(authProvider.notifier)
          .login(emailController.text.trim(), passwordController.text.trim());
    } catch (e) {
      setState(() => error = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextfield(controller: emailController, hintText: 'Email'),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),
              const SizedBox(height: 20),
              if (error != null)
                Text(error!, style: const TextStyle(color: Colors.red)),
              ElevatedButton(
                onPressed: auth.isLoading ? null : _login,
                child:
                    auth.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
