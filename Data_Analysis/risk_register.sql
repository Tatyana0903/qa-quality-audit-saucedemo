BEGIN;

DROP TABLE IF EXISTS risk_mitigations;
DROP TABLE IF EXISTS risks;

CREATE TABLE risks (
    risk_id      BIGSERIAL PRIMARY KEY,
    title        TEXT NOT NULL,
    description  TEXT NOT NULL,
    area         TEXT NOT NULL,   -- Auth, Inventory, Cart, Checkout, UI
    risk_type    TEXT NOT NULL,   -- Functional, Security, Data, Usability, Performance
    likelihood   SMALLINT NOT NULL CHECK (likelihood BETWEEN 1 AND 5),
    impact       SMALLINT NOT NULL CHECK (impact BETWEEN 1 AND 5),
    risk_score   SMALLINT GENERATED ALWAYS AS (likelihood * impact) STORED,
    priority     TEXT NOT NULL CHECK (priority IN ('Low','Medium','High','Critical')),
    detection    TEXT NOT NULL,   -- how to detect/test
    status       TEXT NOT NULL DEFAULT 'Open'
        CHECK (status IN ('Open','In Progress','Mitigated','Accepted','Closed')),
    created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE risk_mitigations (
    mitigation_id BIGSERIAL PRIMARY KEY,
    risk_id       BIGINT NOT NULL REFERENCES risks(risk_id) ON DELETE CASCADE,
    mitigation    TEXT NOT NULL,
    test_idea     TEXT,
    status        TEXT NOT NULL DEFAULT 'Planned'
        CHECK (status IN ('Planned','Implemented','Verified')),
    created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Seed: przykładowe ryzyka dla SauceDemo
INSERT INTO risks (title, description, area, risk_type, likelihood, impact, priority, detection, status)
VALUES
('Auth boundary issue (access without login)',
 'Risk that protected pages (inventory/checkout) can be accessed without valid login/session.',
 'Auth', 'Security', 3, 5, 'Critical',
 'Try direct navigation to protected URLs without login; verify redirect and no data exposure.',
 'Open'),

('Session / cart state leakage',
 'Risk that cart/session data persists incorrectly between users or after logout (localStorage/cookies).',
 'Cart', 'Data', 2, 5, 'High',
 'Logout/login with another user; verify cart is empty and state is isolated; check storage behavior.',
 'Open'),

('Incorrect cart totals / item list inconsistency',
 'Risk that totals, cart badge count or item list becomes inconsistent after add/remove operations.',
 'Cart', 'Functional', 3, 4, 'High',
 'Add multiple items, remove one; verify badge count, cart contents, and totals logic.',
 'Open'),

('Checkout validation gaps',
 'Risk that checkout form allows invalid inputs (empty fields, special chars, too long values) or fails on edge cases.',
 'Checkout', 'Functional', 4, 4, 'Critical',
 'Validation matrix tests: empty, long strings, special chars, postal code formats.',
 'Open'),

('Ability to checkout with empty cart',
 'Risk that user can proceed to checkout without items (missing server-side validation).',
 'Checkout', 'Security', 2, 4, 'Medium',
 'Attempt to start checkout with empty cart / via direct URL; verify blocked and proper message.',
 'Open'),

('Sorting incorrect or inconsistent',
 'Risk that inventory sorting (name/price asc/desc) does not match selected option.',
 'Inventory', 'Functional', 3, 3, 'Medium',
 'Verify sorting by comparing visible list to expected ordering (asc/desc) for name/price.',
 'Open'),

('Flaky UI behavior impacting automation',
 'Risk that UI timing/async rendering causes flaky tests (unstable locators, animations, race conditions).',
 'UI', 'Usability', 4, 3, 'High',
 'Use stable locators (data-test), proper waits, avoid sleep; track flaky rate/retries.',
 'Open');

-- Mitigations
INSERT INTO risk_mitigations (risk_id, mitigation, test_idea, status)
VALUES
(1, 'Add auth boundary checks and enforce redirect to login.', 'Open inventory/checkout URL unauthenticated -> expect redirect.', 'Planned'),
(2, 'Ensure state isolation and storage cleanup on logout.', 'After logout clear storage; login another user -> cart empty.', 'Planned'),
(3, 'Add assertions for badge count and cart contents after each operation.', 'Add 3 items, remove 1 -> badge=2 and correct items list.', 'Planned'),
(4, 'Create dataset-driven validation tests for checkout form.', 'Run inputs: empty/long/special chars; verify errors per field.', 'Planned'),
(6, 'Add property-based style sorting checks.', 'Assert list is sorted by name/price according to option.', 'Planned');

COMMIT;

-- 1) Top risks by score
SELECT risk_id, title, area, risk_type, likelihood, impact, risk_score, priority, status
FROM risks
ORDER BY risk_score DESC, impact DESC;

-- 2) Distribution by area
SELECT area, COUNT(*) AS risk_count, AVG(risk_score)::numeric(10,2) AS avg_score
FROM risks
GROUP BY area
ORDER BY risk_count DESC;

-- 3) Risks without mitigations (gaps)
SELECT r.risk_id, r.title, r.area, r.priority
FROM risks r
LEFT JOIN risk_mitigations m ON m.risk_id = r.risk_id
WHERE m.mitigation_id IS NULL
ORDER BY r.priority DESC, r.risk_id;


