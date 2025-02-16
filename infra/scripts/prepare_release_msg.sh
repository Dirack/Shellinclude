#!/bin/bash
#
# Generate current release message based on active develop branch name

CURRENTVERSION=$(git tag | sort -r | tr '\n' ' ' | cut -d" " -f1)

LATESTVERSION=$(git tag | sort -r | tr '\n' ' ' | cut -d" " -f2)

GITLOG=$(git log "...$LATESTVERSION" --oneline)

ADDED=$(echo "$GITLOG" | grep -E "\[(feat|test)\]" | sed 's/^/- /')
if [ -n "$ADDED" ]
then
    echo "## Added"
    echo "$ADDED"
    echo ""
fi

CHANGED=$(echo "$GITLOG" | grep -E "\[(perf|docs)\]" | sed 's/^/- /')
if [ -n "$CHANGED" ]
then
    echo "## Changed"
    echo "$CHANGED"
    echo ""
fi

FIXED=$(echo "$GITLOG" | grep -E "\[(fix)\]" | sed 's/^/- /')
if [ -n "$FIXED" ]
then
    echo "## Fixed"
    echo "$FIXED"
    echo ""
fi

REMOVED=$(echo "$GITLOG" | grep -E "\[(revert)\]" | sed 's/^/- /')
if [ -n "$REMOVED" ]
then
    echo "## Removed"
    echo "$REMOVED"
    echo ""
fi

DEVELOPMENT=$(echo "$GITLOG" | grep -E "\[(build|chore|refactor|style)\]" | sed 's/^/- /')
if [ -n "$DEVELOPMENT" ]
then
    echo "## Development"
    echo "$DEVELOPMENT"
    echo ""
fi
