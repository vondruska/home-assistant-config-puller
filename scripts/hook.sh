#!/bin/sh
git -C /homeassistant pull origin master
curl -X POST "$HOME_ASSiSTANT_URL/api/services/homeassistant/restart"
