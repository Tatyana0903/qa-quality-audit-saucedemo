# Playwright Automation Layer

This directory contains automated UI tests implemented using Playwright.

**Scope**

The automation suite covers critical business flows:

- User authentication (positive & negative)
- Cart behavior validation
- Checkout validation
- Prevention of order placement with empty cart

**Test Strategy**

Automation focuses on:

- High-risk scenarios
- Business-critical flows
- Regression-prone validation logic

**Structure**

- tests/ – test specifications
- pages/ – Page Object Model classes
- playwright.config.ts – configuration

**Covered modules**

- login.spec.ts – authentication validation
- logout.spec.ts – logout flow validation
- cart.spec.ts – cart functionality
- cart-negative.spec.ts – negative cart scenarios
- checkout.spec.ts – positive and negative checkout scenarios

**How to run**

```bash
cd automation/playwright
npm install
npx playwright test

**Tech stack**

 - Playwright
 - TypeScript
 - Node.js

*Known issues identified during automation*

Some negative automated scenarios reflect real defects documented in the Bug_Reports folder, including:
 - checkout with empty cart
 - whitespace-only values accepted as valid input
 - special characters accepted without validation
