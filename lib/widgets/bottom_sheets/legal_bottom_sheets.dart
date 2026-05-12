import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum LegalDocumentType { termsOfUse, privacyPolicy }

class LegalBottomSheet extends StatelessWidget {
  final LegalDocumentType type;

  const LegalBottomSheet({super.key, required this.type});

  static void showTerms(BuildContext context) {
    _show(context, LegalDocumentType.termsOfUse);
  }

  static void showPrivacyPolicy(BuildContext context) {
    _show(context, LegalDocumentType.privacyPolicy);
  }

  static void _show(BuildContext context, LegalDocumentType type) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => LegalBottomSheet(type: type),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final isTerms = type == LegalDocumentType.termsOfUse;
    final title = isTerms ? 'TERMS OF USE' : 'PRIVACY POLICY';
    final sections = isTerms ? _termsSections : _privacySections;

    return AppBlur(
      blur: 104,
      borderRadius: BorderRadius.vertical(top: Radius.circular(27.r)),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.c.white.s80,
          borderRadius: BorderRadius.vertical(top: Radius.circular(27.r)),
        ),
        padding: Space.hf(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 36.w,
              height: 5.h,
              margin: Space.only(top: 5),
              decoration: BoxDecoration(
                color: Color(0xFFA3A8AD),
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
            14.verticalSpace,

            // Header row: Title + Close
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppText.h1xb!.cl(AppTheme.c.black.base)),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text('Close', style: AppText.b1!.cl(AppTheme.c.blue)),
                ),
              ],
            ),
            20.verticalSpace,

            // Scrollable content
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sections
                      .map((section) => _buildSection(section))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(_LegalSection section) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title (e.g. "1. Account Registration")
          if (section.title != null)
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: RichText(
                text: TextSpan(
                  children: [
                    if (section.number != null)
                      TextSpan(
                        text: '${section.number}. ',
                        style: AppText.b1b!.cl(AppTheme.c.black.base),
                      ),
                    TextSpan(
                      text: section.title,
                      style: AppText.b1b!.cl(AppTheme.c.black.base),
                    ),
                  ],
                ),
              ),
            ),

          // Sub-title (e.g. "a. Information You Provide")
          if (section.subTitle != null)
            Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 6.h),
              child: Text(
                section.subTitle!,
                style: AppText.b1b!.cl(AppTheme.c.black.base),
              ),
            ),

          // Body paragraphs
          for (final paragraph in section.paragraphs)
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text(
                paragraph,
                style: AppText.b1!.cl(AppTheme.c.black.s80),
              ),
            ),

          // Inline bold label before bullets (e.g. "You agree to:")
          if (section.bulletLabel != null)
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                section.bulletLabel!,
                style: AppText.b1b!.cl(AppTheme.c.black.base),
              ),
            ),

          // Bullet points
          for (final bullet in section.bullets)
            Padding(
              padding: EdgeInsets.only(left: 4.w, bottom: 4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 8.w),
                    child: Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                        color: AppTheme.c.black.base,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bullet,
                      style: AppText.b1!.cl(AppTheme.c.black.s80),
                    ),
                  ),
                ],
              ),
            ),

          // Footer paragraph (after bullets)
          if (section.footerParagraph != null)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                section.footerParagraph!,
                style: AppText.b1!.cl(AppTheme.c.black.s80),
              ),
            ),
        ],
      ),
    );
  }

  // ─── TERMS OF USE DATA ────────────────────────────────────────────────────

  static final List<_LegalSection> _termsSections = [
    _LegalSection(
      number: 1,
      title: 'Account Registration',
      paragraphs: ['To access certain features, you must create an account.'],
      bulletLabel: 'You agree to:',
      bullets: [
        'Provide accurate and current information',
        'Maintain the security of your login credentials',
        'Notify us immediately of unauthorized access',
        'Be responsible for all activity under your account',
      ],
      footerParagraph:
          'We reserve the right to suspend or terminate accounts that violate these Terms.',
    ),
    _LegalSection(
      number: 2,
      title: 'Use of the App',
      paragraphs: [
        'You agree to use the App only for lawful purposes.',
        'You may not:',
      ],
      bullets: [
        'Violate any applicable laws or regulations',
        'Attempt to gain unauthorized access to the App or other accounts',
        'Interfere with or disrupt the App\'s functionality',
        'Upload malicious code or harmful content',
        'Impersonate another person or entity',
      ],
    ),
    _LegalSection(
      number: 3,
      title: 'Intellectual Property',
      paragraphs: [
        'All content in the App, including text, graphics, logos, and software, is owned by us or our licensors and protected by applicable intellectual property laws.',
      ],
    ),
    _LegalSection(
      number: 4,
      title: 'Limitation of Liability',
      paragraphs: [
        'To the fullest extent permitted by law, we are not liable for any indirect, incidental, or consequential damages arising from your use of the App.',
      ],
    ),
    _LegalSection(
      number: 5,
      title: 'Changes to Terms',
      paragraphs: [
        'We may update these Terms at any time. Continued use of the App after changes constitutes acceptance of the new Terms.',
      ],
    ),
  ];

  // ─── PRIVACY POLICY DATA ──────────────────────────────────────────────────

  static final List<_LegalSection> _privacySections = [
    _LegalSection(
      number: 1,
      title: 'Information We Collect',
      subTitle: 'a. Information You Provide',
      paragraphs: [
        'When you create an account or use the App, we may collect:',
      ],
      bullets: [
        'Name',
        'Email address',
        'Phone number',
        'Username and password',
        'Profile information',
        'Any content you upload or submit',
      ],
    ),
    _LegalSection(
      number: 2,
      title: 'Automatically Collected Information',
      paragraphs: ['When you use the App, we may automatically collect:'],
      bullets: [
        'Device type and model',
        'Operating system',
        'IP address',
        'App usage data',
        'Crash logs and diagnostics',
      ],
    ),
    _LegalSection(
      number: 3,
      title: 'Information from Third Parties',
      paragraphs: [
        'If you log in using a third-party service (such as Google or Apple), we may receive basic profile information associated with that account.',
      ],
    ),
    _LegalSection(
      number: 4,
      title: 'How We Use Your Information',
      paragraphs: ['We use the information we collect to:'],
      bullets: [
        'Provide, maintain, and improve our services',
        'Send you important notifications and updates',
        'Respond to your inquiries and support requests',
        'Monitor and analyze usage patterns',
        'Ensure security and prevent fraud',
      ],
    ),
    _LegalSection(
      number: 5,
      title: 'Data Sharing',
      paragraphs: [
        'We do not sell your personal information. We may share data with trusted service providers who assist in operating the App, subject to confidentiality obligations.',
      ],
    ),
  ];
}

// ─── DATA MODEL ──────────────────────────────────────────────────────────────

class _LegalSection {
  final int? number;
  final String? title;
  final String? subTitle;
  final List<String> paragraphs;
  final String? bulletLabel;
  final List<String> bullets;
  final String? footerParagraph;

  const _LegalSection({
    this.number,
    this.title,
    this.subTitle,
    this.paragraphs = const [],
    this.bulletLabel,
    this.bullets = const [],
    this.footerParagraph,
  });
}
