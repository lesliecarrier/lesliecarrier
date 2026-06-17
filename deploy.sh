#!/bin/sh
. ./config.sh
git diff-index --quiet HEAD

if [ "$hugo_gallery_domain" = "" ]; then
    echo "Missing configuration values"
    exit 1
fi

echo "Uploading to Domain $hugo_gallery_domain"

echo "IMAGES"
if command -v s3cmd >/dev/null; then
    s3cmd sync public/ s3://$hugo_gallery_domain/
else
    echo "Warning: s3cmd not found, skipping image sync."
fi

if command -v aws >/dev/null; then
    aws cloudfront create-invalidation --distribution-id E4OOAMFRCHT09 --paths "/*"
else
    echo "Warning: aws CLI not found, skipping CloudFront invalidation."
fi
