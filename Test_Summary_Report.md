Test Summary Report
--
Project: SauceDemo Functional Quality Audit
Tester: Tatyana Syrovatko
Test Type: Functional / Risk-Based Testing
Test Cycle: Sprint 1

1. Test Scope
--
The objective of this test cycle was to validate core business-critical flows:
User authentication
Cart behavior and state management
Checkout validation logic
Order confirmation process
Testing was executed using a risk-based approach derived from the identified Risk Register.

2. Test Environment
--
Application: SauceDemo (Web)
Browser: Chrome 144.0.7559.133
OS: Windows 11 24H2
Test Type: Manual functional testing

3. Test Coverage Overview
--
Total User Stories Covered: 3
Total Identified Risks: 7
Total Test Cases Designed: 12
Total Test Cases Executed: 12

Coverage includes:
--
Positive scenarios
Negative validation scenarios
Boundary validation
Business logic validation
Security access validation

4. Test Execution Summary
--
Total Executed: 12
Passed: 9
Failed: 3
Blocked: 0
Not Executed: 0

Failure Rate: 25%
--

5. Defect Summary
--
Total Defects Raised: 3

Breakdown by Severity:

Critical: 1
High: 1
Medium: 1

Critical Defect
--
Order can be placed with empty cart (Total = 0$)
Business impact: Violates checkout integrity and financial logic.

High Defect
--
Whitespace-only input accepted during checkout.
Business impact: Data integrity issue.

Medium Defect
--
Special characters accepted without validation.
Business impact: Input validation weakness.

6. Risk Assessment
--
The most significant risk identified:

RSK-005 – Ability to checkout with empty cart
--
This issue directly impacts transactional integrity and could result in inconsistent order records.
Risk mitigation requires backend validation enforcement.

7. Quality Evaluation
--

Strengths:
--

Core navigation works correctly
Cart add/remove logic functions properly
Authentication boundaries enforced

Weaknesses:
--
Missing input validation
Business logic gap in checkout flow








