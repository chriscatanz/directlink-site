#!/bin/bash

# List of all HTML files to update
FILES=(
  "index.html"
  "about/index.html"
  "blog/index.html"
  "contact/index.html"
  "virtual-banker/index.html"
  "conversion-concierge/index.html"
  "touchtone-banker/index.html"
)

for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    echo "Updating $file..."
    
    # Determine path prefix based on file location
    if [[ "$file" == "index.html" ]]; then
      PREFIX="./"
    else
      PREFIX="../"
    fi
    
    # Replace old nav-dropdown menu with mega menu in header
    sed -i 's|<div class="nav-dropdown-menu">|<div class="mega-menu"><div class="mega-menu-grid">|g' "$file"
    sed -i 's|</div>\s*</div>\s*<a href="[^"]*about|</div></div></div><a href="'"${PREFIX}"'about|g' "$file"
    
    # Update nav-dropdown-item to mega-menu-item
    sed -i 's|nav-dropdown-item|mega-menu-item|g' "$file"
    sed -i 's|nav-dropdown-icon|mega-menu-icon|g' "$file"
    sed -i 's|nav-dropdown-text|mega-menu-text|g' "$file"
    
    # Update demo button links
    sed -i 's|href="[^"]*contact/"[^>]*class="btn btn-primary">Request Demo|href="#" onclick="openDemoModal(); return false;" class="btn btn-primary">Request Demo|g' "$file"
    sed -i 's|href="[^"]*contact/"[^>]*class="btn btn-primary">Schedule a Demo|href="#" onclick="openDemoModal(); return false;" class="btn btn-primary">Schedule a Demo|g' "$file"
    sed -i 's|href="[^"]*contact/"[^>]*class="btn btn-primary">Schedule Your Demo|href="#" onclick="openDemoModal(); return false;" class="btn btn-primary">Schedule Your Demo|g' "$file"
    sed -i 's|href="[^"]*contact/"[^>]*class="btn btn-primary">Get Started|href="#" onclick="openDemoModal(); return false;" class="btn btn-primary">Get Started|g' "$file"
    
  fi
done

echo "Done updating files"
