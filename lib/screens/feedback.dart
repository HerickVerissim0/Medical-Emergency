import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedbackUser extends StatefulWidget {
  const FeedbackUser({super.key});

  @override
  State<FeedbackUser> createState() => _FeedbackUserState();
}

class _FeedbackUserState extends State<FeedbackUser> {
  final TextEditingController _feedbackController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _rating = 0;
  bool _isLoading = false;

  Future<void> _submitFeedback() async {
    final feedback = _feedbackController.text;
    if (feedback.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, escreva seu feedback.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseFirestore.instance.collection('feedbacks').add({
        'userId': _auth.currentUser?.uid,
        'userEmail': _auth.currentUser?.email,
        'feedback': feedback,
        'rating': _rating,
        'timestamp': FieldValue.serverTimestamp(),
      });

      if (context.mounted) {
        _feedbackController.clear();
        setState(() {
          _rating = 0;
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Feedback enviado! Obrigado!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao enviar feedback: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color:
              theme.brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.feedback,
                      size: 48,
                      color: theme.brightness == Brightness.dark
                          ? const Color(0xFF1976D2)
                          : Colors.blue[700],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Sua opinião é muito importante!',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ajude-nos a melhorar nosso aplicativo',
                      style: TextStyle(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Conteúdo
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: theme.dividerColor.withOpacity(0.2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deixe seu comentário:',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.brightness == Brightness.dark
                                    ? const Color(0xFF1976D2)
                                    : Colors.blue[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _feedbackController,
                              maxLines: 5,
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Escreva aqui seus comentários',
                                hintStyle: TextStyle(
                                  color: theme.brightness == Brightness.dark
                                      ? Colors.white38
                                      : Colors.black38,
                                ),
                                fillColor: theme.brightness == Brightness.dark
                                    ? Colors.white10
                                    : theme.cardColor,
                                filled: true,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Avaliação:',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.brightness == Brightness.dark
                                    ? const Color(0xFF1976D2)
                                    : Colors.blue[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return IconButton(
                                  icon: Icon(
                                    index < _rating
                                        ? Icons.star
                                        : Icons.star_border,
                                  ),
                                  color: theme.brightness == Brightness.dark
                                      ? const Color(0xFF1976D2)
                                      : Colors.blue[700],
                                  iconSize: 40,
                                  onPressed: () {
                                    setState(() {
                                      _rating = index + 1;
                                    });
                                  },
                                );
                              }),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _submitFeedback,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      theme.brightness == Brightness.dark
                                          ? const Color(0xFF1976D2)
                                          : Colors.blue[700],
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      )
                                    : const Text('Enviar Feedback'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
