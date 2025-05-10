# Xss.sh - XSS Payload Testing Script

`Xss.sh` is a script designed to test a target website for potential Cross-Site Scripting (XSS) vulnerabilities by sending various XSS payloads through URL parameters and form inputs. It checks if any of the payloads are reflected on the page, indicating a potential vulnerability.

## Features

1. Tests for XSS vulnerabilities by injecting payloads into URL parameters and form inputs.
2. Supports a variety of XSS payloads.
3. Silent mode to reduce unnecessary output.
4. Automatically extracts input parameters from forms on the target page.
5. Reflects and tests payloads to detect potential XSS vulnerabilities.

## Prerequisites

1. **bash**: The script is written in bash and should run on any system that supports bash.
2. **Python 3**: Used for URL encoding of payloads.
3. **curl**: Used for making HTTP requests to the target website.

Make sure the following tools are installed on your system:

- `curl`
- `python3`

## How to Use

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where the script is located.

3. Make the script executable:

   ```bash
   chmod +x Xss.sh


When prompted, enter the target URL you want to test. For example:

nginx
Copy
Edit
Enter target URL (e.g. https://example.com/search?q=): https://example.com/search?q=
The script will automatically begin testing the target URL for potential XSS vulnerabilities by sending different payloads.

XSS Payloads
The script includes a wide variety of XSS payloads, such as:

<script>alert('XSS')</script>

<img src=x onerror=alert('XSS')>

<iframe src=javascript:alert('XSS')></iframe>

And more...

These payloads will be URL-encoded and appended to the target URL to test for reflected XSS vulnerabilities.

How It Works
URL-based Testing: The script first appends each XSS payload to the target URL and sends the request. It checks if the payload is reflected in the response.

Form Input Testing: The script will also parse the HTML of the target page to find input parameters (like those inside <input>, <textarea>, and <select> tags). It then injects the payloads into those parameters and checks for reflections.

Reporting: After each test, the script outputs whether the payload was reflected in the response, indicating a potential XSS vulnerability.

Example Output
bash
Copy
Edit
🎯 Enter target URL (e.g. https://example.com/search?q=): https://example.com/search?q=

🚀 Starting XSS tests on: https://example.com/search?q=

⚡ Testing payload:
<script>alert('XSS')</script>

🛑 Potential XSS reflected!

⚡ Testing payload:
<img src=x onerror=alert('XSS')>

✅ Not reflected.
Notes
This script is for educational purposes only. It should only be used on websites you own or have permission to test. Unauthorized testing of websites can lead to legal consequences.

The script does not test for stored XSS vulnerabilities (e.g., those that are stored in databases) but only for reflected XSS.

Payloads are designed to test the basic reflected XSS, and additional payloads may be added to improve coverage.
