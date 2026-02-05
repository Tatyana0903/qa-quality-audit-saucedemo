Test Cases - Cart and Session
--
Related risks:
--
RSK-002 - Session / cart state leakage
RSK-003 - Incorrect cart totals / item list inconsistency
RSK-005 - Ability to checkout with empty cart


Purpose: Verify cart state consistency, totals correctness, session isolation between users, and prevention of checkout without items.
--
TC-CART-001 - Add single item to cart 
--
Priority: High
--
Preconditions:
--
User is logged in and is on the inventory page.

Test steps:
--
1. Add one product to the cart from the inventory list.
2. Open the cart page.

Expected result:
--
Cart badge shows "1".
Cart contains exactly one item.
Item name and price are displayed.

Actual result:
--
One product was successfully added to the cart.
The cart page displayed the correct product name and price.
The cart badge correctly showed the value “1”.

TC-CART-002 - Add multiple items and verify cart badge and list count
--
Priority: High
--
Preconditions:
--
User is logged in and is on the inventory page.

Test steps:
--
1. Add three different products to the cart.
2. Verify the cart badge value.
3. Open the cart page.
4. Count the number of items displayed.

Expected result:
--
Cart badge shows "3".
Cart shows exactly three items.
No duplicates appear unless the app explicitly supports quantity.

Actual result:
--
Three different products were added to the cart.
All three items were displayed correctly in the cart.
No duplicate items appeared.
The cart badge correctly showed the value “3”.

TC-CART-003 - Remove item from cart and verify badge and list update
--
Priority: High
--
Preconditions:
--
User is logged in and has at least two items in the cart.

Test steps:
--
1. Open the cart page.
2. Remove one item from the cart.
3. Verify the cart badge value.
4. Verify the number of items in the cart.

Expected result:
--
Cart badge decreases by 1.
Removed item is no longer visible.
Remaining items stay unchanged.

Actual result:
--
The selected product was successfully removed from the cart.
The cart badge value was updated accordingly after removal.
The remaining items stayed unchanged and were displayed correctly

TC-CART-004 - Cart total consistency after add/remove operations
--
Priority: High
--
Preconditions:
--
User is logged in and has multiple items added to the cart.

Test steps:
--
1. Open the cart and proceed to checkout overview (if available).
2. Note item prices and the displayed total (if total is shown).
3. Go back and remove one item.
4. Proceed again to the overview/summary.
5. Compare totals.

Expected result:
--
Totals and item list are consistent with current cart contents.
No outdated items remain in the summary.
No incorrect total is displayed.

Actual result:
--
The total price for all added products was not displayed.
No summary or total amount was visible for the cart contents.

TC-CART-005 - Refresh page does not break cart badge and contents
--
Priority: Medium
--
Preconditions:
--
User is logged in and has at least one item in the cart.

Test steps:
--
1. Confirm cart badge shows the correct number of items.
2. Refresh the inventory page (F5).
3. Open the cart page.
4. Refresh the cart page (F5).

Expected result:
--
Cart badge remains correct after refresh.
Cart contents remain consistent after refresh.
No items disappear or duplicate unexpectedly.

Actual result:
--
After refreshing the page, the number of items in the cart did not change.
The cart badge value remained consistent.
Cart contents were preserved correctly after page refresh.

















































