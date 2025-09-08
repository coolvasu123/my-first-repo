#!/bin/bash

# test-app.sh - Simple test to verify the web application files are valid

echo "🧪 Testing web application files..."
echo ""

# Check if HTML files are valid (basic syntax check)
echo "📄 Checking HTML files..."

if command -v tidy >/dev/null 2>&1; then
    for html_file in *.html; do
        if [ -f "$html_file" ]; then
            echo "  Checking $html_file..."
            if tidy -q -e "$html_file" 2>/dev/null; then
                echo "    ✅ $html_file is valid"
            else
                echo "    ⚠️  $html_file has warnings (but may still work)"
            fi
        fi
    done
else
    echo "  ℹ️  tidy not available, skipping HTML validation"
fi

# Check if CSS file exists and is readable
echo ""
echo "🎨 Checking CSS file..."
if [ -f "styles.css" ]; then
    echo "  ✅ styles.css found"
    if [ -s "styles.css" ]; then
        echo "  ✅ styles.css is not empty"
    else
        echo "  ⚠️  styles.css is empty"
    fi
else
    echo "  ❌ styles.css not found"
fi

# Check if JavaScript file exists and is readable
echo ""
echo "⚙️  Checking JavaScript file..."
if [ -f "script.js" ]; then
    echo "  ✅ script.js found"
    if [ -s "script.js" ]; then
        echo "  ✅ script.js is not empty"
    else
        echo "  ⚠️  script.js is empty"
    fi
else
    echo "  ❌ script.js not found"
fi

# Check for common HTML/CSS/JS issues
echo ""
echo "🔍 Checking for common issues..."

# Check if HTML files reference the correct CSS file
if grep -q 'href="style\.css"' *.html; then
    echo "  ⚠️  Found reference to 'style.css' (should be 'styles.css')"
fi

if grep -q 'href="styles\.css"' *.html; then
    echo "  ✅ Found correct reference to 'styles.css'"
fi

echo ""
echo "🏁 Application file check complete!"