import 'package:flutter/material.dart';
import '../models/app_user.dart';
import 'dashboard.dart';
import 'sign_up.dart';
import 'profile.dart';

class SignInPage extends StatefulWidget {
  /// Receive initial user from SignUp if they just registered.
  final AppUser? initialUser;
  const SignInPage({Key? key, this.initialUser}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    // Pre-fill email if coming from SignUp
    if (widget.initialUser != null) {
      _emailCtrl.text = widget.initialUser!.email;
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;

    // In a real app, authenticate against backend here.
    // Then build your AppUser from auth result:
    final user = AppUser(
      name: widget.initialUser?.name ?? 'Abdul Hamid',
      email: _emailCtrl.text.trim(),
      // you could request role/age/about separately or default
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => DashboardPage(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0FA16C);
    const bgGrey = Color(0xFFF3F3F3);
    const radius = 16.0;

    return Scaffold(
      backgroundColor: bgGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // (Header/logo omitted for brevity)
              const SizedBox(height: 28),
              const Text(
                'Welcome Back!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 24),
              Center(
                child: Image.asset('assets/images/Frame2.png', height: 180),
              ),
              const SizedBox(height: 28),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailCtrl,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          filled: true,
                          fillColor: const Color(0xFFF7F7F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(radius),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (v) =>
                            v!.contains('@') ? null : 'Enter valid email',
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _passCtrl,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          filled: true,
                          fillColor: const Color(0xFFF7F7F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(radius),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () =>
                                setState(() => _obscure = !_obscure),
                          ),
                        ),
                        validator: (v) =>
                            v!.length >= 6 ? null : '6+ chars required',
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: green,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
