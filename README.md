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
