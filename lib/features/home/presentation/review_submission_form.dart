import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/data/remote_testimony_repository.dart';
import 'package:portfolio/widgets/appbar/styled_card.dart';

class ReviewSubmissionForm extends ConsumerStatefulWidget {
  const ReviewSubmissionForm({super.key});

  @override
  ConsumerState<ReviewSubmissionForm> createState() =>
      _ReviewSubmissionFormState();
}

class _ReviewSubmissionFormState extends ConsumerState<ReviewSubmissionForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _textController = TextEditingController();
  final _linkController = TextEditingController();
  bool _isSubmitting = false;
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _textController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final repo = ref.read(testimonyRepositoryProvider);
      await repo.submitReview(
        name: _nameController.text.trim(),
        text: _textController.text.trim(),
        email: _emailController.text.trim().isEmpty
            ? null
            : _emailController.text.trim(),
        link: _linkController.text.trim().isEmpty
            ? null
            : _linkController.text.trim(),
      );

      setState(() {
        _submitted = true;
        _isSubmitting = false;
      });

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _textController.clear();
      _linkController.clear();
    } catch (e) {
      setState(() => _isSubmitting = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString().replaceAll('Exception: ', '')}'),
            backgroundColor: context.colorscheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: _submitted
            ? _buildSuccessMessage(context)
            : _buildForm(context),
      ),
    );
  }

  Widget _buildSuccessMessage(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.check_circle_outline,
          size: 64,
          color: context.colorscheme.primary,
        ),
        const Gap(16),
        Text(
          'Thank you for your review!',
          style: context.textStyle.titleLgBold.copyWith(
            color: context.colorscheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        Text(
          'Your review has been submitted and will be published after moderation.',
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.colorscheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(24),
        ElevatedButton(
          onPressed: () => setState(() => _submitted = false),
          child: const Text('Submit Another Review'),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Share Your Experience',
            style: context.textStyle.titleLgBold,
            textAlign: context.isMobile ? TextAlign.center : TextAlign.start,
          ),
          const Gap(8),
          Text(
            'Your feedback helps others and motivates me to keep improving!',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorscheme.onSurfaceVariant,
            ),
            textAlign: context.isMobile ? TextAlign.center : TextAlign.start,
          ),
          const Gap(32),
          if (context.isDesktopOrTablet)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildNameField()),
                const Gap(16),
                Expanded(child: _buildEmailField()),
              ],
            )
          else ...[
            _buildNameField(),
            const Gap(16),
            _buildEmailField(),
          ],
          const Gap(16),
          _buildLinkField(),
          const Gap(16),
          _buildTextField(),
          const Gap(24),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'Your Name *',
        hintText: 'John Doe',
        prefixIcon: const Icon(Icons.person_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().length < 2) {
          return 'Name must be at least 2 characters';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email (optional)',
        hintText: 'john@example.com',
        prefixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value != null && value.isNotEmpty && !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildLinkField() {
    return TextFormField(
      controller: _linkController,
      decoration: InputDecoration(
        labelText: 'LinkedIn/Website (optional)',
        hintText: 'https://linkedin.com/in/yourprofile',
        prefixIcon: const Icon(Icons.link),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: 'Your Review *',
        hintText: 'Share your experience working with me...',
        prefixIcon: const Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Icon(Icons.rate_review_outlined),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        alignLabelWithHint: true,
      ),
      maxLines: 5,
      validator: (value) {
        if (value == null || value.trim().length < 10) {
          return 'Review must be at least 10 characters';
        }
        return null;
      },
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _isSubmitting ? null : _submitReview,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: _isSubmitting
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.colorscheme.onPrimary,
              ),
            )
          : const Text('Submit Review'),
    );
  }
}
