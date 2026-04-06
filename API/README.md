# API Testing – Restful Booker

## Project Goal
The goal of this project is to demonstrate practical API testing using Postman, including authentication, CRUD operations, and automated validation of responses.

## Scope of Testing
- Authentication (POST /auth)
- Create Booking (POST /booking)
- Get Booking by ID (GET /booking/{id})
- Update Booking (PUT /booking/{id})
- Response validation

## Tech Stack
- Postman
- REST API
- JSON
- JavaScript (Postman test scripts)

## Test Scenarios
- Positive scenarios (happy path)
- Negative scenarios (unauthorized access → 403)
- HTTP status code validation
- Response body validation
- Data consistency checks

## Data Handling
- Use of variables (baseUrl, token, bookingId)
- Dynamic token extraction and reuse
- Request chaining (auth → create → get → update)

## How to Run
1. Import the Postman collection
2. Set up environment variables
3. Execute requests in order:
   - Create Token
   - Create Booking
   - Get Booking
   - Update Booking

## Key Skills Demonstrated
- API testing fundamentals and best practices
- Authentication handling (token-based)
- Automated test scripting in Postman
- Working with dynamic data and variables
- End-to-end API flow validation
