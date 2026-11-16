---
# ============================================================================
#  NEW APP TEMPLATE
#  1. Copy this file to _apps/<app-name>.md  (lowercase, hyphens, e.g. _apps/my-app.md)
#     The page will be published at /apps/<app-name>/
#  2. Fill in the fields below.
#  3. Replace the privacy policy text with the policy for this app.
#     Every [BRACKETED] item must be replaced or removed before publishing.
#  This folder (_templates) is never published.
# ============================================================================

name: App Name
tagline: One sentence describing what the app does.
description: Support and Privacy Policy for the App Name app by Perry & Gambill LLC.

# App icon: square PNG, 1024x1024 recommended, saved in assets/img/apps/
#   icon: /assets/img/apps/app-name.png
# Leave blank to show the placeholder tile.
icon:

app_store_url:          # e.g. https://apps.apple.com/app/id0000000000
platforms:              # e.g. [iPhone, iPad, Mac]
support_email:          # leave blank to use the site-wide email from _config.yml

privacy_effective_date: "[Month Day, Year]"

# Optional: keep an old link working
# redirect_from:
#   - /old/path/
---
{%- assign email = page.support_email | default: site.email -%}

## The short version

[A two- or three-sentence plain-language summary of what data the app collects, where it is stored, and whether it is shared.]

## Information we collect

[List each kind of information the app collects, or state that it collects none. Include anything entered by the user, collected automatically, or received from Apple or other services.]

## Where your data is stored

[On device only, in the user's iCloud account, on our servers, or with a third-party provider. Say how long it is kept.]

## Device permissions

[The app asks for these permissions only when you use a feature that needs them.]

- **[Permission] (optional).** [What it is used for.]

## Purchases and Apple services

[In-app purchases or subscriptions, and what, if anything, we receive from Apple.]

## Third parties, tracking and advertising

[Any analytics, advertising, crash reporting or other third-party SDKs, or a statement that there are none.]

## Your control over your data

[How users can view, export or delete their data.]

## Children's privacy

App Name is not directed at children under 13. We do not knowingly collect personal information from children under 13.

## Changes to this policy

If this policy changes, we will update this page and its effective date.

## Contact us

Questions about this policy? Email [{{ email }}](mailto:{{ email }}).
