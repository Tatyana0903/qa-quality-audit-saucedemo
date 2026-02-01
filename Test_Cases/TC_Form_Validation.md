Test Cases - Form Validation
---
Related risk: RSK-004 - Checkout validation gaps
Purpose: Verify that the checkout form properly validates user input and prevents invalid data from being submitted.

TC-FV-001 - Required fields validation
---
Priority: Critical
---

Preconditions:
---
User is logged in, at least one product is added to the cart, and the user is on the checkout information page.


Test steps:
---
1. Leave the "First Name", "Last Name" and "Zip / Postal Code" fields empty.
2. Click the Continue button.

Expected result:
---
The form submission should be blocked.
A validation message should be displayed for the required fields.
The user should remain on the same checkout step.

Actual result:
---
The system displayed the message: "Error: First Name is required".
All input fields were highlighted with a red underline.
The user remained on the same page and could not proceed to the next step.

TC-FV-002 - Whitespace-only input validation
---
Priority: High
---
Preconditions:
---
User is on the checkout information page.

Test steps:
---
1. Enter only spaces into "First Name", "Last Name" and "Zip / Postal Code" fields.
2. Click the Continue button.

Expected result:
---
Whitespace-only values should be treated as empty input.
The form submission should be blocked.
A validation message should be displayed.

Actual result:
---
After entering only spaces into the input fields, no validation message was displayed.
The fields were not highlighted.
The user was allowed to proceed to the checkout overview page.
This behavior indicates that whitespace-only input is treated as valid data.

TC-FV-003 - Special characters validation
---
Priority: Medium
---
Preconditions:
---
User is on the checkout information page.

Test steps:
---
1. Enter special characters (for example: @#$%^&) into all fields.
2. Click the Continue button.

Expected result:
---
If special characters are not allowed, the form should show a validation error and block submission.
If they are allowed, the form should proceed correctly without breaking the UI or causing errors.

Actual result:
---
After entering special characters into the input fields, the system allowed the user to proceed to the next step without displaying any validation message.
No UI issues or errors occurred.

TC-FV-004 - Maximum length validation
---
Priority: High
---
Preconditions:
---
User is on the checkout information page.

Test steps:
---
1. Enter very long values into each field (for example, more than 250 characters).
2. Click the Continue button.

Expected result:
---
The system should prevent entering values above the allowed limit or display a validation error.
The layout of the page should remain stable.
No crash or unexpected behavior should occur.

Actual result:
---
The system allowed very long input values and proceeded to the next step without any validation message or restriction.
No layout issues or crashes occurred.

TC-FV-005 - Numeric values in name fields
---
Priority: Low
---
Preconditions:
---
User is on the checkout information page.

Test steps:
---
1. Enter numeric values into "First Name" and "Last Name" fields.
2. Enter a valid "Zip / Postal Code"
3. Click the Continue button.

Expected result:
---
If numeric names are not allowed, the form should display an error and block submission.
If allowed, the form should proceed correctly without unexpected behavior.

Actual result:
---
The system allowed numeric values in the name fields and proceeded to the next step without any validation message.










