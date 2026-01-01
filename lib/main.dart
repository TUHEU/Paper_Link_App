import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const PaperLinkApp());
}

class PaperLinkApp extends StatelessWidget {
  const PaperLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaperLink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1565C0), Color(0xFF4A148C)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.school, size: 100, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'PaperLink',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Educational Portal',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 50),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: ElevatedButton(
                    onPressed: () => _navigateToAdmin(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.admin_panel_settings),
                        SizedBox(width: 10),
                        Text(
                          'Admin Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: ElevatedButton(
                    onPressed: () => _navigateToStudent(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text(
                          'Student Access',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Educational portal',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const Text(
                  'Manage Student Papers',
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToAdmin(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const AdminLoginPage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  void _navigateToStudent(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const StudentHomePage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _isPasswordVisible.dispose();
    _isLoading.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Admin Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Icon(
                Icons.admin_panel_settings,
                size: 80,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Admin Portal',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Password-based secure access',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
              decoration: InputDecoration(
                labelText: 'Admin Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: _isPasswordVisible,
              builder: (context, isVisible, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: !isVisible,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _loginAsAdmin(),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        _isPasswordVisible.value = !_isPasswordVisible.value;
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _showForgotPasswordDialog(context);
                },
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 30),
            ValueListenableBuilder<bool>(
              valueListenable: _isLoading,
              builder: (context, isLoading, child) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _loginAsAdmin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const StudentHomePage(),
                      transitionsBuilder: (_, animation, __, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                    ),
                  );
                },
                child: const Text('Switch to Student Access'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loginAsAdmin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both username and password'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    _isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));

    _isLoading.value = false;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const AdminHomePage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    }
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final emailController = TextEditingController();
    final focusNode = FocusNode();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter your admin email to receive reset instructions',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                focusNode: focusNode,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Admin Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onFieldSubmitted: (_) {
                  _processPasswordReset(context, emailController.text.trim());
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _processPasswordReset(context, emailController.text.trim());
              },
              child: const Text('Send Instructions'),
            ),
          ],
        );
      },
    ).then((_) {
      emailController.dispose();
      focusNode.dispose();
    });
  }

  void _processPasswordReset(BuildContext context, String email) {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset instructions sent to your email'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.admin_panel_settings,
                size: 200,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Fahdil',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Paper review & communication management',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 15, 10, 145),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 0,
                runSpacing: 0,
                alignment: WrapAlignment.center,
                children: [
                  _buildAdminFeatureCard(
                    icon: Icons.reviews,
                    title: 'Pending Papers',
                    color: Colors.orange,
                    onTap: () {
                      _showPendingPapersScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.reviews,
                    title: 'Paper Review',
                    color: Colors.blue,
                    onTap: () {
                      _showPaperReviewScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.chat,
                    title: 'Messages',
                    color: Colors.green,
                    onTap: () {
                      _showAdminMessages(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.analytics,
                    title: 'Analytics',
                    color: Colors.purple,
                    onTap: () {
                      _showAnalyticsScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.settings,
                    title: 'Settings',
                    color: Colors.red,
                    onTap: () {
                      _showAdminSettings(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.group,
                    title: 'User Management',
                    color: Colors.teal,
                    onTap: () {
                      _showUserManagementScreen(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPendingPapersScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  const Text(
                    'Pending Papers for Approval',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildPendingPaperItem(
                          'Introduction to Machine Learning',
                          'STU2024001',
                          'John Doe',
                          'Computer Science',
                          '2024-01-15',
                          '12MB',
                          context,
                          setState,
                        ),
                        _buildPendingPaperItem(
                          'Quantum Physics Research',
                          'STU2024002',
                          'Jane Smith',
                          'Physics',
                          '2024-01-10',
                          '8MB',
                          context,
                          setState,
                        ),
                        _buildPendingPaperItem(
                          'Modern Economic Theories',
                          'STU2024003',
                          'Bob Johnson',
                          'Economics',
                          '2024-01-05',
                          '15MB',
                          context,
                          setState,
                        ),
                        _buildPendingPaperItem(
                          'Data Structures Assignment',
                          'STU2024004',
                          'Alice Brown',
                          'Computer Science',
                          '2024-01-20',
                          '5MB',
                          context,
                          setState,
                        ),
                        _buildPendingPaperItem(
                          'Chemical Reactions Study',
                          'STU2024005',
                          'Charlie Wilson',
                          'Chemistry',
                          '2024-01-18',
                          '10MB',
                          context,
                          setState,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPendingPaperItem(
    String title,
    String studentId,
    String studentName,
    String subject,
    String date,
    String fileSize,
    BuildContext context,
    StateSetter setState,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student: $studentName ($studentId)'),
            Text('Subject: $subject'),
            Text('Date: $date • Size: $fileSize'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check_circle, color: Colors.green),
              onPressed: () {
                _acceptPaper(context, title, studentId);
              },
              tooltip: 'Accept Paper',
            ),
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.red),
              onPressed: () {
                _rejectPaper(context, title, studentId);
              },
              tooltip: 'Reject Paper',
            ),
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.blue),
              onPressed: () {
                _viewPaperDetails(context, title, studentId);
              },
              tooltip: 'View Details',
            ),
          ],
        ),
      ),
    );
  }

  void _acceptPaper(BuildContext context, String title, String studentId) {
    showDialog(
      context: context,
      builder: (context) {
        final gradeController = TextEditingController();
        final feedbackController = TextEditingController();
        String selectedGrade = 'A';

        return AlertDialog(
          title: const Text('Accept Paper'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Accepting: $title'),
                Text('Student ID: $studentId'),
                const SizedBox(height: 20),
                const Text('Assign Grade:'),
                DropdownButtonFormField<String>(
                  value: selectedGrade,
                  items: const [
                    DropdownMenuItem(value: 'A', child: Text('A')),
                    DropdownMenuItem(value: 'B+', child: Text('B+')),
                    DropdownMenuItem(value: 'B', child: Text('B')),
                    DropdownMenuItem(value: 'C+', child: Text('C+')),
                    DropdownMenuItem(value: 'C', child: Text('C')),
                    DropdownMenuItem(value: 'D', child: Text('D')),
                    DropdownMenuItem(value: 'F', child: Text('F')),
                  ],
                  onChanged: (value) {
                    selectedGrade = value!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: feedbackController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Feedback (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Paper "$title" accepted with grade $selectedGrade',
                    ),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Accept Paper'),
            ),
          ],
        );
      },
    );
  }

  void _rejectPaper(BuildContext context, String title, String studentId) {
    showDialog(
      context: context,
      builder: (context) {
        final reasonController = TextEditingController();

        return AlertDialog(
          title: const Text('Reject Paper'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Rejecting: $title'),
              Text('Student ID: $studentId'),
              const SizedBox(height: 20),
              TextField(
                controller: reasonController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Reason for rejection',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (reasonController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please provide a reason for rejection'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Paper "$title" rejected'),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text('Reject Paper'),
            ),
          ],
        );
      },
    );
  }

  void _viewPaperDetails(BuildContext context, String title, String studentId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Student ID: $studentId'),
                const SizedBox(height: 10),
                const Text('Subject: Computer Science'),
                const SizedBox(height: 10),
                const Text('Submitted: 2024-01-15'),
                const SizedBox(height: 10),
                const Text('File Size: 12MB'),
                const SizedBox(height: 10),
                const Text('Format: PDF'),
                const SizedBox(height: 20),
                const Text(
                  'Abstract:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'This paper explores the fundamentals of machine learning algorithms and their applications in modern technology.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Downloading paper...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _showPaperReviewScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'Paper Review',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildPaperReviewItem(
                      'Introduction to Machine Learning',
                      'STU2024001',
                      'Pending',
                    ),
                    _buildPaperReviewItem(
                      'Quantum Physics Research',
                      'STU2024002',
                      'Under Review',
                    ),
                    _buildPaperReviewItem(
                      'Modern Economic Theories',
                      'STU2024003',
                      'Reviewed',
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Paper review feature opened'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('View All Papers'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaperReviewItem(String title, String studentId, String status) {
    Color statusColor = Colors.grey;
    if (status == 'Pending') statusColor = Colors.orange;
    if (status == 'Under Review') statusColor = Colors.blue;
    if (status == 'Reviewed') statusColor = Colors.green;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
        title: Text(title),
        subtitle: Text('Student ID: $studentId'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: statusColor),
          ),
          child: Text(
            status,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          // Navigate to detailed review page
        },
      ),
    );
  }

  void _showAdminMessages(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'Admin Messages',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    MessageBubble(
                      text: 'Hello Admin, when will my paper be reviewed?',
                      isMe: false,
                      time: '10:30 AM',
                    ),
                    MessageBubble(
                      text:
                          'Your paper is in the queue, will be reviewed within 24 hours.',
                      isMe: true,
                      time: '10:35 AM',
                    ),
                    MessageBubble(
                      text: 'Thank you!',
                      isMe: false,
                      time: '10:36 AM',
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your reply...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Message sent successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAnalyticsScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Analytics Dashboard'),
          content: SizedBox(
            height: 300,
            child: Column(
              children: [
                const Text('Total Papers Submitted: 156'),
                const SizedBox(height: 20),
                const Text('Papers Pending Review: 24'),
                const SizedBox(height: 20),
                const Text('Papers Approved: 112'),
                const SizedBox(height: 20),
                const Text('Average Review Time: 2.3 days'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Detailed analytics opened'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('View Detailed Report'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showAdminSettings(BuildContext context) {
    bool notificationsEnabled = true;
    bool emailAlerts = true;
    bool autoApprove = false;
    bool darkMode = false;
    String language = 'English';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  const Text(
                    'Admin Settings',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        SwitchListTile(
                          title: const Text('Enable Notifications'),
                          subtitle: const Text(
                            'Receive alerts for new submissions',
                          ),
                          value: notificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              notificationsEnabled = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('Email Alerts'),
                          subtitle: const Text(
                            'Get email notifications for important updates',
                          ),
                          value: emailAlerts,
                          onChanged: (value) {
                            setState(() {
                              emailAlerts = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('Auto-Approve Papers'),
                          subtitle: const Text(
                            'Automatically approve papers from trusted students',
                          ),
                          value: autoApprove,
                          onChanged: (value) {
                            setState(() {
                              autoApprove = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('Dark Mode'),
                          value: darkMode,
                          onChanged: (value) {
                            setState(() {
                              darkMode = value;
                            });
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.language),
                          title: const Text('Language'),
                          subtitle: const Text('Select interface language'),
                          trailing: DropdownButton<String>(
                            value: language,
                            items: const [
                              DropdownMenuItem(
                                value: 'English',
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: 'Spanish',
                                child: Text('Spanish'),
                              ),
                              DropdownMenuItem(
                                value: 'French',
                                child: Text('French'),
                              ),
                              DropdownMenuItem(
                                value: 'Arabic',
                                child: Text('Arabic'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                language = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.security),
                          title: const Text('Security Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showSecuritySettings(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.backup),
                          title: const Text('Backup & Restore'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showBackupSettings(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.palette),
                          title: const Text('Theme Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showThemeSettings(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.notifications_active),
                          title: const Text('Notification Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showNotificationSettings(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.storage),
                          title: const Text('Storage Management'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showStorageSettings(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.api),
                          title: const Text('API Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showAPISettings(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.help),
                          title: const Text('Help & Support'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showAdminHelpSupport(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.info),
                          title: const Text('About PaperLink'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _showAboutDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Settings saved successfully'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: const Text('Save Settings'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showSecuritySettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Security Settings'),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Two-Factor Authentication'),
                  subtitle: const Text('Add an extra layer of security'),
                  value: true,
                  onChanged: (value) {},
                ),
                SwitchListTile(
                  title: const Text('Session Timeout'),
                  subtitle: const Text('Auto-logout after 30 minutes'),
                  value: true,
                  onChanged: (value) {},
                ),
                SwitchListTile(
                  title: const Text('IP Restriction'),
                  subtitle: const Text('Allow access only from specific IPs'),
                  value: false,
                  onChanged: (value) {},
                ),
                ListTile(
                  title: const Text('Change Password'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pop(context);
                    _showAdminChangePassword(context);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showAdminChangePassword(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Admin Password'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Current Password',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'New Password'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm New Password',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (newPasswordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Passwords do not match'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Admin password changed successfully!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showBackupSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Backup & Restore'),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.backup),
                  title: const Text('Create Backup'),
                  subtitle: const Text('Backup all data to cloud'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Backup created successfully'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.restore),
                  title: const Text('Restore Backup'),
                  subtitle: const Text('Restore from previous backup'),
                  onTap: () {
                    _showRestoreDialog(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.schedule),
                  title: const Text('Auto Backup'),
                  subtitle: const Text('Configure automatic backups'),
                  onTap: () {
                    _showAutoBackupSettings(context);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showRestoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Restore Backup'),
          content: const Text('Select backup file to restore from:'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Restore process started'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Restore'),
            ),
          ],
        );
      },
    );
  }

  void _showAutoBackupSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        bool dailyBackup = true;
        bool weeklyBackup = false;
        String backupTime = '02:00';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Auto Backup Settings'),
              content: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Daily Backup'),
                      value: dailyBackup,
                      onChanged: (value) {
                        setState(() {
                          dailyBackup = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Weekly Backup'),
                      value: weeklyBackup,
                      onChanged: (value) {
                        setState(() {
                          weeklyBackup = value;
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Backup Time'),
                      subtitle: Text('Daily at $backupTime'),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Show time picker
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Auto backup settings saved'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showThemeSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String selectedTheme = 'Blue';
        bool adaptiveTheme = true;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Theme Settings'),
              content: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Theme Color'),
                      trailing: DropdownButton<String>(
                        value: selectedTheme,
                        items: const [
                          DropdownMenuItem(value: 'Blue', child: Text('Blue')),
                          DropdownMenuItem(
                            value: 'Green',
                            child: Text('Green'),
                          ),
                          DropdownMenuItem(
                            value: 'Purple',
                            child: Text('Purple'),
                          ),
                          DropdownMenuItem(value: 'Red', child: Text('Red')),
                          DropdownMenuItem(
                            value: 'Orange',
                            child: Text('Orange'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedTheme = value!;
                          });
                        },
                      ),
                    ),
                    SwitchListTile(
                      title: const Text('Adaptive Theme'),
                      subtitle: const Text('Adjust theme based on system'),
                      value: adaptiveTheme,
                      onChanged: (value) {
                        setState(() {
                          adaptiveTheme = value;
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Preview Theme'),
                      trailing: const Icon(Icons.visibility),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Theme preview'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Theme settings saved'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        bool newPaperNotification = true;
        bool messageNotification = true;
        bool approvalNotification = true;
        bool soundEnabled = true;
        bool vibrationEnabled = true;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Notification Settings'),
              content: SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: const Text('New Paper Submission'),
                        subtitle: const Text(
                          'Notify when students submit papers',
                        ),
                        value: newPaperNotification,
                        onChanged: (value) {
                          setState(() {
                            newPaperNotification = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: const Text('New Messages'),
                        subtitle: const Text('Notify when receiving messages'),
                        value: messageNotification,
                        onChanged: (value) {
                          setState(() {
                            messageNotification = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Paper Approvals'),
                        subtitle: const Text(
                          'Notify when papers need approval',
                        ),
                        value: approvalNotification,
                        onChanged: (value) {
                          setState(() {
                            approvalNotification = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Sound'),
                        value: soundEnabled,
                        onChanged: (value) {
                          setState(() {
                            soundEnabled = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Vibration'),
                        value: vibrationEnabled,
                        onChanged: (value) {
                          setState(() {
                            vibrationEnabled = value;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Notification Sound'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // Show sound selection
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Notification settings saved'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showStorageSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Storage Management'),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                const LinearProgressIndicator(
                  value: 0.65,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 10),
                const Text('Storage Used: 65% (13GB/20GB)'),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Clear Cache'),
                  subtitle: const Text('Free up temporary storage'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cache cleared successfully'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('View Storage Details'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showStorageDetails(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.backup),
                  title: const Text('Upgrade Storage'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showUpgradeStorage(context);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showStorageDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Storage Details'),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                _buildStorageItem('Papers & Documents', '8.5 GB', Colors.blue),
                _buildStorageItem('Images & Media', '3.2 GB', Colors.green),
                _buildStorageItem('Database', '1.1 GB', Colors.orange),
                _buildStorageItem('Cache', '0.2 GB', Colors.grey),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStorageItem(String label, String size, Color color) {
    return ListTile(
      leading: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      title: Text(label),
      trailing: Text(size),
    );
  }

  void _showUpgradeStorage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Upgrade Storage'),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                _buildStoragePlan('Basic', '20 GB', '\$0/month', false),
                _buildStoragePlan('Pro', '100 GB', '\$9.99/month', true),
                _buildStoragePlan(
                  'Enterprise',
                  '500 GB',
                  '\$29.99/month',
                  false,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Storage upgrade initiated'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Upgrade'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStoragePlan(
    String name,
    String storage,
    String price,
    bool recommended,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: recommended ? Colors.blue[50] : null,
      child: ListTile(
        title: Text(name),
        subtitle: Text('$storage storage'),
        trailing: Text(price),
        onTap: () {
          // Select plan
        },
      ),
    );
  }

  void _showAPISettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('API Settings'),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.vpn_key),
                  title: const Text('API Key'),
                  subtitle: const Text('********************'),
                  trailing: const Icon(Icons.copy),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('API key copied to clipboard'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.autorenew),
                  title: const Text('Generate New API Key'),
                  onTap: () {
                    _generateNewAPIKey(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text('API Permissions'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showAPIPermissions(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text('API Usage History'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showAPIHistory(context);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _generateNewAPIKey(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Generate New API Key'),
          content: const Text(
            'This will invalidate your current API key. Are you sure?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('New API key generated successfully'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Generate'),
            ),
          ],
        );
      },
    );
  }

  void _showAPIPermissions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        bool readAccess = true;
        bool writeAccess = true;
        bool deleteAccess = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('API Permissions'),
              content: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Read Access'),
                      subtitle: const Text('Allow reading data via API'),
                      value: readAccess,
                      onChanged: (value) {
                        setState(() {
                          readAccess = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Write Access'),
                      subtitle: const Text('Allow writing data via API'),
                      value: writeAccess,
                      onChanged: (value) {
                        setState(() {
                          writeAccess = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Delete Access'),
                      subtitle: const Text('Allow deleting data via API'),
                      value: deleteAccess,
                      onChanged: (value) {
                        setState(() {
                          deleteAccess = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('API permissions updated'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showAPIHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('API Usage History'),
          content: SizedBox(
            height: 300,
            width: 400,
            child: ListView(
              children: [
                _buildAPIHistoryItem(
                  'GET /api/papers',
                  '2024-01-15 10:30',
                  'Success',
                ),
                _buildAPIHistoryItem(
                  'POST /api/upload',
                  '2024-01-15 09:15',
                  'Success',
                ),
                _buildAPIHistoryItem(
                  'GET /api/users',
                  '2024-01-14 16:45',
                  'Failed',
                ),
                _buildAPIHistoryItem(
                  'PUT /api/paper/123',
                  '2024-01-14 14:20',
                  'Success',
                ),
                _buildAPIHistoryItem(
                  'DELETE /api/cache',
                  '2024-01-13 11:10',
                  'Success',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                // Export history
              },
              child: const Text('Export'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAPIHistoryItem(
    String endpoint,
    String timestamp,
    String status,
  ) {
    return ListTile(
      title: Text(endpoint),
      subtitle: Text(timestamp),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: status == 'Success' ? Colors.green[100] : Colors.red[100],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: status == 'Success' ? Colors.green[800] : Colors.red[800],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showAdminHelpSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help & Support'),
          content: SizedBox(
            height: 300,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Documentation'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Opening documentation'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_support),
                  title: const Text('Contact Support'),
                  onTap: () {
                    _showContactSupport(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.feedback),
                  title: const Text('Send Feedback'),
                  onTap: () {
                    _showFeedbackDialog(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bug_report),
                  title: const Text('Report Bug'),
                  onTap: () {
                    _showBugReportDialog(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.video_library),
                  title: const Text('Video Tutorials'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Opening video tutorials'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showContactSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Contact Support'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Email: nadaljunior999@gmail.com'),
              const Text('Phone: 653039108'),
              const SizedBox(height: 20),
              const Text('Support Hours:'),
              const Text('Monday-Friday: 9AM-6PM'),
              const Text('Saturday: 10AM-4PM'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Open email client
                },
                child: const Text('Send Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    final feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Send Feedback'),
          content: TextField(
            controller: feedbackController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Enter your feedback here...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (feedbackController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter your feedback'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Feedback sent successfully!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }

  void _showBugReportDialog(BuildContext context) {
    final bugController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Report Bug'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: bugController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Describe the bug you encountered...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Please include steps to reproduce the issue.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (bugController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please describe the bug'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Bug report submitted!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('About PaperLink'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.school, size: 50, color: Colors.blue),
              const SizedBox(height: 20),
              const Text(
                'PaperLink v2.0.1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Educational Portal Management System'),
              const SizedBox(height: 10),
              const Text('© 2026 PaperLink Inc.'),
              const SizedBox(height: 10),
              const Text('All rights reserved'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Show licenses
                },
                child: const Text('View Licenses'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showUserManagementScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'User Management',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildUserItem('John Doe', 'STU2024001', 'Student', true),
                    _buildUserItem('Jane Smith', 'STU2024002', 'Student', true),
                    _buildUserItem(
                      'Bob Johnson',
                      'STU2024003',
                      'Student',
                      false,
                    ),
                    _buildUserItem('Admin User', 'ADM001', 'Admin', true),
                    _buildUserItem(
                      'Alice Brown',
                      'STU2024004',
                      'Student',
                      true,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showAddUserDialog(context);
                },
                child: const Text('Add New User'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserItem(String name, String id, String role, bool active) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: active ? Colors.green : Colors.grey,
          child: Text(name[0]),
        ),
        title: Text(name),
        subtitle: Text('$id • $role'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                active ? Icons.toggle_on : Icons.toggle_off,
                color: active ? Colors.green : Colors.grey,
              ),
              onPressed: () {
                // Toggle user active status
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                // Edit user
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final idController = TextEditingController();
    String selectedRole = 'Student';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New User'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'User ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  items: const [
                    DropdownMenuItem(value: 'Student', child: Text('Student')),
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                      value: 'Reviewer',
                      child: Text('Reviewer'),
                    ),
                  ],
                  onChanged: (value) {
                    selectedRole = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    idController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User added successfully'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Add User'),
            ),
          ],
        );
      },
    );
  }
}

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final List<Map<String, dynamic>> _approvedPapers = [
    {
      'id': '1',
      'title': 'Introduction to Machine Learning',
      'subject': 'Computer Science',
      'date': '2024-01-15',
      'status': 'Approved',
      'grade': 'A',
    },
    {
      'id': '2',
      'title': 'Quantum Physics Research',
      'subject': 'Physics',
      'date': '2024-01-10',
      'status': 'Approved',
      'grade': 'B+',
    },
    {
      'id': '3',
      'title': 'Modern Economic Theories',
      'subject': 'Economics',
      'date': '2024-01-05',
      'status': 'Approved',
      'grade': 'A-',
    },
  ];

  final List<Map<String, dynamic>> _pendingSubmissions = [
    {
      'id': '1',
      'title': 'Data Structures Assignment',
      'subject': 'Computer Science',
      'date': '2024-01-20',
      'status': 'Pending Review',
    },
  ];

  final List<String> _selectedSubjects = ['Computer Science', 'Physics'];
  final List<Map<String, dynamic>> _exercises = [
    {
      'id': '1',
      'title': 'Machine Learning Problem Set',
      'subject': 'Computer Science',
      'date': '2 hours ago',
      'completed': false,
    },
    {
      'id': '2',
      'title': 'Quantum Mechanics Exercises',
      'subject': 'Physics',
      'date': '1 day ago',
      'completed': true,
    },
  ];

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome back,',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Dear Student',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Colors.grey,
                  size: 22,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              _showNotifications(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.chat_bubble_outline,
              color: Colors.grey,
              size: 22,
            ),
            onPressed: _openMessages,
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red, size: 20),
                    SizedBox(width: 10),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return _buildBody(index);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showUploadDialog,
        icon: const Icon(Icons.upload, size: 20),
        label: const Text('Upload Paper', style: TextStyle(fontSize: 14)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (newIndex) => _selectedIndex.value = newIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard, size: 22),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books, size: 22),
                label: 'Papers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome, size: 22),
                label: 'AI Exercises',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 22),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildDashboard();
      case 1:
        return _buildPapersList();
      case 2:
        return _buildAIExercises();
      case 3:
        return _buildProfile();
      default:
        return _buildDashboard();
    }
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickStats(),
          const SizedBox(height: 24),
          _buildPendingSubmissions(),
          const SizedBox(height: 24),
          _buildRecentPapers(),
          const SizedBox(height: 24),
          _buildAIExerciseCard(),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.spaceAround,
        children: [
          _buildStatItem(
            Icons.check_circle,
            '${_approvedPapers.length}',
            'Approved',
            Colors.green,
          ),
          _buildStatItem(
            Icons.pending,
            '${_pendingSubmissions.length}',
            'Pending',
            Colors.orange,
          ),
          _buildStatItem(
            Icons.upload_file,
            '${_approvedPapers.length + _pendingSubmissions.length}',
            'Total Uploads',
            Colors.blue,
          ),
          _buildStatItem(Icons.grade, 'A-', 'Avg Grade', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildPendingSubmissions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pending Submissions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ..._pendingSubmissions.map(
          (paper) => _buildPaperCard(paper, isPending: true),
        ),
      ],
    );
  }

  Widget _buildRecentPapers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Approved Papers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => _selectedIndex.value = 1,
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ..._approvedPapers.take(2).map((paper) => _buildPaperCard(paper)),
      ],
    );
  }

  Widget _buildPaperCard(Map<String, dynamic> paper, {bool isPending = false}) {
    return GestureDetector(
      onTap: () {
        _showPaperDetails(paper);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getSubjectIcon(paper['subject']),
              color: Colors.blue,
              size: 24,
            ),
          ),
          title: Text(
            paper['title'],
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(paper['subject']),
              const SizedBox(height: 4),
              Text(
                'Submitted: ${paper['date']}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isPending ? Colors.orange[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              paper['status'],
              style: TextStyle(
                color: isPending ? Colors.orange[800] : Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAIExerciseCard() {
    return GestureDetector(
      onTap: () => _selectedIndex.value = 2,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1565C0), Color(0xFF4A148C)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AI Exercise Generator',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Get personalized exercises based on your selected subjects',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => _selectedIndex.value = 2,
                    icon: const Icon(Icons.auto_awesome, size: 16),
                    label: const Text('Generate Exercises'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1565C0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.auto_awesome, size: 50, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildPapersList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _approvedPapers.length + _pendingSubmissions.length,
      itemBuilder: (context, index) {
        final allPapers = [..._approvedPapers, ..._pendingSubmissions];
        final paper = allPapers[index];
        final isPending = index >= _approvedPapers.length;

        return GestureDetector(
          onTap: () {
            _showPaperDetails(paper);
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
                size: 35,
              ),
              title: Text(
                paper['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(paper['subject']),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: [
                      if (paper['grade'] != null)
                        Chip(
                          label: Text(paper['grade']),
                          backgroundColor: Colors.green[50],
                          labelStyle: const TextStyle(fontSize: 12),
                        ),
                      Chip(
                        label: Text(paper['status']),
                        backgroundColor: isPending
                            ? Colors.orange[50]
                            : Colors.blue[50],
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility, size: 22),
                    onPressed: () {
                      _showPaperDetails(paper);
                    },
                    tooltip: 'View Details',
                  ),
                  IconButton(
                    icon: const Icon(Icons.download, size: 22),
                    onPressed: () {
                      _downloadPaper(paper);
                    },
                    tooltip: 'Download',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAIExercises() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AI Exercise Generator',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Select subjects to generate personalized exercises',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          _buildSubjectSelection(),
          const SizedBox(height: 24),
          _buildGeneratedExercises(),
        ],
      ),
    );
  }

  Widget _buildSubjectSelection() {
    final subjects = [
      'Computer Science',
      'Mathematics',
      'Physics',
      'Economics',
      'Literature',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Subjects',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: subjects.map((subject) {
            final isSelected = _selectedSubjects.contains(subject);
            return FilterChip(
              label: Text(subject),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    _selectedSubjects.add(subject);
                  } else {
                    _selectedSubjects.remove(subject);
                  }
                });
              },
              selectedColor: Colors.blue[100],
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              if (_selectedSubjects.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select at least one subject'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              }

              _generateExercises();
            },
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Generate New Exercises'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGeneratedExercises() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Exercises',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ..._exercises.map((exercise) {
          return GestureDetector(
            onTap: () {
              _showExerciseDetails(exercise);
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: exercise['completed']
                      ? Colors.green[100]
                      : Colors.blue[100],
                  child: Icon(
                    exercise['completed'] ? Icons.check : Icons.quiz,
                    color: exercise['completed'] ? Colors.green : Colors.blue,
                  ),
                ),
                title: Text(exercise['title']),
                subtitle: Text(
                  '${exercise['subject']} • Generated ${exercise['date']}',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!exercise['completed'])
                      IconButton(
                        icon: const Icon(Icons.check, size: 20),
                        onPressed: () {
                          _markExerciseCompleted(exercise['id']);
                        },
                        tooltip: 'Mark as completed',
                      ),
                    IconButton(
                      icon: const Icon(Icons.download, size: 20),
                      onPressed: () {
                        _downloadExercise(exercise);
                      },
                      tooltip: 'Download',
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 32),
          _buildProfileMenuItem(Icons.history, 'Submission History', () {
            _showSubmissionHistory(context);
          }),
          _buildProfileMenuItem(Icons.settings, 'Settings', () {
            _showSettings(context);
          }),
          _buildProfileMenuItem(Icons.help_outline, 'Help & Support', () {
            _showHelpSupport(context);
          }),
          _buildProfileMenuItem(Icons.logout, 'Logout', () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomePage()),
            );
          }, isLogout: true),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(
    IconData icon,
    String text,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.grey[700]),
      title: Text(
        text,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showUploadDialog() {
    final titleController = TextEditingController();
    final subjectController = TextEditingController();
    String? selectedFileType = 'PDF';
    String? selectedSubject = 'Computer Science';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 24,
                  right: 24,
                  top: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Document',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Select file type:'),
                    Wrap(
                      spacing: 8,
                      children: ['PDF', 'DOCX', 'JPEG', 'PNG'].map((type) {
                        return ChoiceChip(
                          label: Text(type),
                          selected: selectedFileType == type,
                          onSelected: (selected) {
                            setState(() {
                              selectedFileType = type;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    const Text('Select subject:'),
                    DropdownButtonFormField<String>(
                      initialValue: selectedSubject,
                      items: const [
                        DropdownMenuItem(
                          value: 'Computer Science',
                          child: Text('Computer Science'),
                        ),
                        DropdownMenuItem(
                          value: 'Mathematics',
                          child: Text('Mathematics'),
                        ),
                        DropdownMenuItem(
                          value: 'Physics',
                          child: Text('Physics'),
                        ),
                        DropdownMenuItem(
                          value: 'Economics',
                          child: Text('Economics'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Choose subject',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Document Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('File picker would open here'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              size: 48,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text('Tap to select file'),
                            Text(
                              'Supports: PDF, DOCX, JPEG, PNG',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (titleController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a title'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Document uploaded successfully!',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              // Add to pending submissions
                              setState(() {
                                _pendingSubmissions.add({
                                  'id': '${_pendingSubmissions.length + 1}',
                                  'title': titleController.text,
                                  'subject': selectedSubject!,
                                  'date': DateTime.now().toString().split(
                                    ' ',
                                  )[0],
                                  'status': 'Pending Review',
                                });
                              });
                            },
                            child: const Text('Upload'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _openMessages() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext sheetContext) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: MediaQuery.of(sheetContext).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'Messages to Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    MessageBubble(
                      text: 'When will my paper be reviewed?',
                      isMe: true,
                      time: '10:30 AM',
                    ),
                    MessageBubble(
                      text:
                          'Your paper is in the queue, will be reviewed within 24 hours.',
                      isMe: false,
                      time: '10:35 AM',
                    ),
                    MessageBubble(
                      text: 'Can I submit a revised version?',
                      isMe: true,
                      time: 'Yesterday',
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your message to admin...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Message sent successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotifications(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildNotificationItem(
                      'Your paper has been approved!',
                      '2 hours ago',
                      Icons.check_circle,
                      Colors.green,
                    ),
                    _buildNotificationItem(
                      'New comment on your submission',
                      '5 hours ago',
                      Icons.comment,
                      Colors.blue,
                    ),
                    _buildNotificationItem(
                      'Reminder: Assignment due tomorrow',
                      '1 day ago',
                      Icons.notifications_active,
                      Colors.orange,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All notifications marked as read'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Mark All as Read'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem(
    String title,
    String time,
    IconData icon,
    Color color,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      subtitle: Text(time),
      trailing: IconButton(
        icon: const Icon(Icons.close, size: 16),
        onPressed: () {},
      ),
      onTap: () {},
    );
  }

  void _showPaperDetails(Map<String, dynamic> paper) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(paper['title']),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Subject: ${paper['subject']}'),
                const SizedBox(height: 10),
                Text('Submitted: ${paper['date']}'),
                const SizedBox(height: 10),
                Text('Status: ${paper['status']}'),
                const SizedBox(height: 10),
                if (paper['grade'] != null) Text('Grade: ${paper['grade']}'),
                if (paper['feedback'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text('Feedback:'),
                      Text(paper['feedback']),
                    ],
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                _downloadPaper(paper);
                Navigator.pop(context);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _downloadPaper(Map<String, dynamic> paper) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading ${paper['title']}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _generateExercises() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Generating exercises...'),
        duration: Duration(seconds: 2),
      ),
    );

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _exercises.insert(0, {
          'id': '${_exercises.length + 1}',
          'title': 'New ${_selectedSubjects.first} Exercise',
          'subject': _selectedSubjects.first,
          'date': 'Just now',
          'completed': false,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Exercises generated successfully!'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  void _showExerciseDetails(Map<String, dynamic> exercise) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(exercise['title']),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Subject: ${exercise['subject']}'),
              const SizedBox(height: 10),
              Text('Generated: ${exercise['date']}'),
              const SizedBox(height: 10),
              const Text('Exercise Content:'),
              const SizedBox(height: 10),
              const Text(
                '1. Solve the following problems:\n2. Explain the concepts:\n3. Apply to real-world scenarios:',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                _downloadExercise(exercise);
                Navigator.pop(context);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _markExerciseCompleted(String id) {
    setState(() {
      final index = _exercises.indexWhere((e) => e['id'] == id);
      if (index != -1) {
        _exercises[index]['completed'] = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exercise marked as completed!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _downloadExercise(Map<String, dynamic> exercise) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading ${exercise['title']}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showPersonalInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Personal Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Edit personal information'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Edit'),
            ),
          ],
        );
      },
    );
  }

  void _showAccountSecurity(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Account Security'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Change Password'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  _showChangePasswordDialog(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text('Two-Factor Authentication'),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Current Password',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'New Password'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm New Password',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (newPasswordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Passwords do not match'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password changed successfully!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showSubmissionHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Submission History'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView(
              children: [
                ..._approvedPapers.map(
                  (paper) => ListTile(
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    title: Text(paper['title']),
                    subtitle: Text('${paper['date']} • ${paper['grade']}'),
                  ),
                ),
                ..._pendingSubmissions.map(
                  (paper) => ListTile(
                    leading: const Icon(Icons.pending, color: Colors.orange),
                    title: Text(paper['title']),
                    subtitle: Text('${paper['date']} • ${paper['status']}'),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.palette),
                title: const Text('Theme'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Settings saved successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Save Settings'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showHelpSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help & Support'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('FAQs'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.contact_support),
                title: const Text('Contact Support'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Send Feedback'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                onTap: () {},
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  IconData _getSubjectIcon(String subject) {
    switch (subject) {
      case 'Computer Science':
        return Icons.computer;
      case 'Physics':
        return Icons.science;
      case 'Economics':
        return Icons.bar_chart;
      default:
        return Icons.book;
    }
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isMe) const CircleAvatar(child: Icon(Icons.person)),
          if (!isMe) const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[50] : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, maxLines: 3, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) const SizedBox(width: 8),
          if (isMe) const CircleAvatar(child: Icon(Icons.person)),
        ],
      ),
    );
  }
}
