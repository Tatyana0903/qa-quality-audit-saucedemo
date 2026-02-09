Title:
--
Checkout form accepts special characters in required fields and allows order submission

Description:
--
The checkout form does not validate special characters in required fields.
The system accepts invalid input and allows the user to complete the order process without displaying any error message.

Preconditions:
--
User is logged in
At least one product is added to the cart
User is on checkout information page

Steps to Reproduce:
--
1. Navigate to checkout information page.
2. Enter special characters (e.g. @#$%^&) in required fields.
3. Click on the button [Continue].
4. Complete the order process.

Expected Result
--
System should reject invalid input and display validation message.

Actual Result
--
No validation message is displayed.
Special characters are accepted as valid input.
Order can be completed successfully.

Environment:
--
Web application - SauceDemo
Browser: Chrome 144.0.7559.133
OS: Windows 11, 24H2

Related Risk
--
RSK-004 – Checkout validation gaps

Severity:
--
High

Priority:
--
High

Type:
--
Functional
