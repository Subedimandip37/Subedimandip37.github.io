#!/bin/bash

# Image compression script for Jekyll website
# This script compresses images while maintaining good quality

echo "🖼️  Starting image compression..."

# Create backup directory
mkdir -p assets/img/backup
cp assets/img/*.jpg assets/img/backup/ 2>/dev/null || true
cp assets/img/*.jpeg assets/img/backup/ 2>/dev/null || true
cp assets/img/*.png assets/img/backup/ 2>/dev/null || true

echo "📁 Backup created in assets/img/backup/"

# Compress JPEG images
echo "🔄 Compressing JPEG images..."
for img in assets/img/*.jpg assets/img/*.jpeg; do
    if [ -f "$img" ]; then
        echo "Processing: $img"
        # Compress with 85% quality (good balance between size and quality)
        convert "$img" -quality 85 -strip "$img"
    fi
done

# Compress PNG images
echo "🔄 Compressing PNG images..."
for img in assets/img/*.png; do
    if [ -f "$img" ]; then
        echo "Processing: $img"
        # Compress PNG with optimization
        convert "$img" -strip -quality 90 "$img"
    fi
done

# Create WebP versions for modern browsers (even smaller)
echo "🔄 Creating WebP versions for modern browsers..."
for img in assets/img/*.jpg assets/img/*.jpeg assets/img/*.png; do
    if [ -f "$img" ]; then
        filename=$(basename "$img")
        name="${filename%.*}"
        echo "Creating WebP: $name.webp"
        convert "$img" -quality 85 "assets/img/${name}.webp"
    fi
done

echo "✅ Image compression completed!"
echo "📊 Checking file sizes..."

# Show before/after comparison
echo "📈 File size comparison:"
ls -lh assets/img/*.jpg assets/img/*.png | head -10 