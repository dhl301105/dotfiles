#!/bin/bash

LOCATION="thanh_pho_hai_duong"  # Thay bằng tên thành phố của bạn
WEATHER=$(curl -s "wttr.in/$LOCATION?format=%c+%t")  

echo "$WEATHER"
