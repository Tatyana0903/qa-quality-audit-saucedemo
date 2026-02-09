Title
--
Checkout form accepts whitespace-only input and allows order progression

Severity
--
High

Priority
--
High

Type
--
Functional / Input Validation

Environment:
--
Web application – SauceDemo Browser: Chrome 144.x OS: Windows 11, 24H2

Preconditions:
--
User is logged in
At least one product is added to the cart
User is on checkout information page

Steps to Reproduce:
--
1. Navigate to checkout information page.
2. Enter only spaces in required fields:
- First Name
- Last Name
- Zip
- / Postal Code
3. Click Continue.

Expected Result:
--
Whitespace-only input should be treated as empty.
Validation error should be displayed.
User should remain on the checkout information page.

Actual Result:
--
No validation message is displayed.
Spaces are processed as valid input.
User is redirected to the order summary page.

Related Test Case:
--
TC-CHK-003 – Whitespace-only input validation

Related Risk
--
RSK-004 – Checkout validation gaps







