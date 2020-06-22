#!/bin/sh
source config.sh
git diff-index --quiet HEAD

if [ "$hugo_gallery_domain" == "" ]; then
    echo "Missing configuration values"
    exit 1
fi

echo "Uploading to Domain $hugo_gallery_domain"

echo "IMAGES"
s3cmd sync public/ s3://$hugo_gallery_domain/

aws cloudfront create-invalidation --distribution-id E4OOAMFRCHT09 --paths "/*"
