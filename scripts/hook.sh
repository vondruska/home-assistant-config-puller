#!/bin/sh
git -C /homeassistant pull origin master
curl -X POST "$HOME_ASSISTANT_URL/api/services/homeassistant/restart"
