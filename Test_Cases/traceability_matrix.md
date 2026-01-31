# Traceability — How Identified Risks Are Covered by Test Cases

The purpose of this document is to demonstrate how identified business and technical risks
are directly covered by specific test scenarios.

Each risk defined in the Risk Register has assigned test cases that are designed
to either detect the risk manifestation or prevent it.

This approach reflects real QA practices where testing activities are directly
driven by risk analysis rather than random scenario coverage.


## RSK-004 — Checkout validation gaps (Critical)

This risk refers to the possibility of submitting invalid data in the checkout form
(empty fields, special characters, overly long inputs, and missing boundary validations).

**Test coverage:**

- TC-CHK-001 — Boundary value validation for checkout form fields
- TC-CHK-002 — Validation of empty fields and special characters


## RSK-001 — Auth boundary issue (Critical)

This risk describes a situation where protected pages (such as checkout or inventory)
can be accessed without a valid authenticated session.

**Test coverage:**

- TC-AUTH-001 — Attempt to access protected URLs without logging in
- TC-AUTH-002 — Verification of application behavior after logout (session handling)


## RSK-003 — Cart totals / item list inconsistency (High)

This risk concerns inconsistencies between cart badge count, item list, and total price
after adding or removing products.

**Test coverage:**

- TC-CART-001 — Add/remove items and verify badge count and totals


## RSK-002 — Session / cart state leakage (High)

This risk refers to cart data persisting between different users
or remaining after logout.

**Test coverage:**

- TC-CART-002 — Cart isolation between different users


## RSK-007 — Flaky UI behavior impacting automation (High)

This risk is related to unstable UI behavior affecting automated tests
(asynchronous rendering, animations, timing issues).

**Test coverage:**

- TC-UI-001 — UI stability checks, proper waits, and elimination of timing dependency


## RSK-006 — Sorting incorrect / inconsistent (Medium)

This risk describes incorrect product sorting (name/price ascending/descending).

**Test coverage:**

- TC-INV-001 — Verification of sorting correctness

