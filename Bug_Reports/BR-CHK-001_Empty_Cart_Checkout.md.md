Title:
--
System allows order submission with empty cart resulting in total amount 0$

Severity: Critical
--
Priority: Highest
--
Type: Security / Business Logic
--
Environment:
--
Web application – SauceDemo
Browser: Chrome 144.x
OS: Windows 11, 24H2

Preconditions:
--
User is logged in
Cart is empty

Steps to reproduce:
--
1. Open cart page.
2. Click the button [Checkout].
3. Enter valid personal data.
4. Complete order.

Expected result:
--
System should block checkout when cart is empty.
User should see validation message or be redirected.

Actual result:
--
Order is successfully placed.
Confirmation page is displayed.
Total amount equals 0$.

Related Risk: RSK-005
--
Related Test Case: TC-CHK-001
--



