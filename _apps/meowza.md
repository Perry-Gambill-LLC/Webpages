---
name: Meowza
tagline: Chat with Mr. Whiskers, a friendly AI cat companion who remembers your conversations.
description: Support and Privacy Policy for the Meowza app by Perry & Gambill LLC.

# Position on the Apps page (lower numbers first)
order: 2

# App icon: square PNG in assets/img/apps/ (leave blank to show the placeholder tile)
icon: /assets/img/apps/meowza.png

# Optional extras (shown only when filled in)
app_store_url: https://apps.apple.com/us/app/meowza/id6770110988
platforms:              # e.g. [iPhone, iPad]
support_email:          # leave blank to use the site-wide email from _config.yml

privacy_effective_date: August 3, 2026
---
{%- assign email = page.support_email | default: site.email -%}

## 1. Introduction

Welcome. This Privacy Policy explains how Perry & Gambill LLC ("we," "us," or "our") collects, uses, discloses, and safeguards your information when you use Meowza (the "App"), an AI-powered conversational companion. Please read this policy carefully. If you disagree with its terms, please discontinue use of the App.

We reserve the right to make changes to this Privacy Policy at any time. We will notify you of significant changes by updating the "Last Updated" date above and, where appropriate, through in-app notifications or email.

## 2. Information We Collect

### 2.1 Information You Provide Directly

- **Account Information:** Name, email address, and sign-in credentials when you register.
- **Profile Data:** Optional profile details you choose to provide, including your date of birth (used to personalize your companion experience, such as recognizing your birthday).
- **Chat Messages:** The messages you send to the AI companion. These are stored encrypted at rest using AES-256-GCM encryption and are used to generate AI responses and maintain conversation continuity.
- **Communications:** Feedback or support requests you send us.
- **Payment Information:** If applicable, billing name, address, and payment method details (processed securely by third-party payment processors — we do not store full card numbers).

### 2.2 Information Collected Automatically

- **Usage Data:** Features accessed, actions taken, session duration, and frequency of use.
- **Device Information:** Device type, operating system, browser type and version, unique device identifiers.
- **Log Data:** IP address, access timestamps, error logs, and referring URLs.
- **Cookies & Tracking Technologies:** We use cookies, web beacons, and similar technologies to maintain sessions and analyze usage patterns.

### 2.3 Information from Third Parties

- **OAuth Providers:** If you sign in via Apple, we receive basic profile information (name, email) as permitted by your settings with that provider.
- **Analytics Partners:** Aggregated and anonymized usage statistics from analytics services.

## 3. How We Use Your Information

We use the information we collect to:

- **Provide and operate** the App and its features.
- **Authenticate** your identity and maintain secure sessions.
- **Generate AI responses:** Your chat messages and profile context are sent to a third-party AI model (the OpenAI API) to generate the companion's responses. Message content is transmitted securely and is not used to train AI models.
- **Maintain conversation memory:** We store a compressed summary of past conversations so the companion can remember context across sessions. This summary is encrypted at rest.
- **Personalize** your experience based on your profile and conversation history.
- **Process transactions** and send related confirmations and receipts.
- **Deliver push notifications** to alert you when your companion has sent a reply.
- **Communicate** with you about updates, new features, security alerts, and support.
- **Improve the App** through analytics, bug tracking, and user research.
- **Enforce our Terms of Service** and protect the security and integrity of the App.
- **Comply with legal obligations** and respond to lawful government requests.

We do not sell your personal information to third parties.

## 4. Legal Bases for Processing (GDPR)

If you are located in the European Economic Area (EEA) or United Kingdom, our legal bases for processing your personal data are:

- **Contractual Necessity:** Account creation, providing core app functionality.
- **Legitimate Interests:** Security monitoring, fraud prevention, product improvement.
- **Legal Obligation:** Tax records, responding to lawful requests.
- **Consent:** Marketing emails, optional analytics.

You may withdraw consent at any time where we rely on it, without affecting the lawfulness of prior processing.

## 5. Sharing Your Information

We may share your information with:

- **Service Providers:** Trusted third-party vendors who assist in operating the App, including Amazon Web Services (cloud infrastructure and push notifications via Amazon SNS), OpenAI (AI model inference), Apple (authentication and payment processing), and analytics providers. These parties are contractually bound to protect your data. Chat messages are transmitted to OpenAI solely to generate AI responses and are not retained by OpenAI for model training purposes under our service agreement.
- **Business Transfers:** In connection with a merger, acquisition, or sale of assets, your data may be transferred. We will provide notice before your data becomes subject to a different privacy policy.
- **Legal Requirements:** When required by law, court order, or governmental authority, or to protect the rights, property, or safety of our users or the public.
- **With Your Consent:** In any other circumstances where you have explicitly authorized disclosure.

## 6. Data Retention

We retain your personal information for as long as your account is active or as needed to provide services. You may request deletion of your account at any time (see Section 8). After deletion, we may retain certain data in anonymized or aggregated form, or where required by law, for a period not exceeding **90 days** following your request.

## 7. Data Security

We implement industry-standard technical and organizational measures to protect your information, including:

- Encryption of data in transit (TLS/HTTPS) and at rest (AES-256-GCM envelope encryption via AWS KMS for all chat messages and conversation summaries).
- Access controls limiting data access to authorized personnel only.
- Regular security audits and vulnerability assessments.

No method of transmission over the internet or electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your data, we cannot guarantee absolute security.

## 8. Your Rights and Choices

Depending on your location, you may have the following rights:

- **Access:** Request a copy of the personal data we hold about you.
- **Correction:** Request correction of inaccurate or incomplete data.
- **Deletion:** Request deletion of your personal data ("right to be forgotten").
- **Portability:** Receive your data in a structured, machine-readable format.
- **Objection:** Object to processing based on legitimate interests.
- **Restriction:** Request we limit processing of your data in certain circumstances.
- **Opt-Out of Marketing:** Unsubscribe from promotional emails via the link in any email or through your account settings.

To exercise any of these rights, contact us at the address in Section 11. We will respond within **30 days**.

## 9. Children's Privacy

The App is not directed to children under the age of **13** (or **16** in the EEA). We do not knowingly collect personal information from children. If we become aware that we have inadvertently collected data from a child under the applicable age, we will take steps to delete it promptly. If you believe a child has provided us with personal information, please contact us immediately.

## 10. Third-Party Links and Services

The App may contain links to third-party websites or integrate with third-party services. This Privacy Policy does not apply to those external services. We encourage you to review the privacy policies of any third-party services you access through the App.

## 11. Contact Us

If you have questions, concerns, or requests regarding this Privacy Policy, please contact us at [{{ email }}](mailto:{{ email }}).

If you are located in the EEA and believe we have not adequately addressed your concerns, you have the right to lodge a complaint with your local data protection authority.

## 12. Changes to This Policy

We may update this Privacy Policy periodically. When we do, we will revise the "Last Updated" date at the top of this page. For material changes, we will provide more prominent notice (such as an in-app banner or email notification). Your continued use of the App after changes take effect constitutes your acceptance of the revised policy.

*This Privacy Policy was last updated on May 17, 2026.*
