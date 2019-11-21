ffmpeg

## DDP 5.1 to DD 5.1
* * *

ffmpeg -hide_banner -hwaccel auto -y -i "input.mkv" -map 0 -c:s copy -c:v copy -c:a ac3 -b:a 640k "output.mkv"

## 10-bit x265 to 8-bit x264 
* * *
ffmpeg -hide_banner -i 10_bit.mkv -c:v libx265 -preset fast -x265-params crf=28 -pix_fmt yuv420p -c:a copy 8_bit.mkv


## 8-bit x264 to 8-bit x265
* * *
ffmpeg -hide_banner -hwaccel d3d11va -i 8_bit.mkv -report -sn -map 0:0 -c:v libx264 -preset fast -map 0:1 -acodec copy test.mkv

## Trim Video
* * *
ffmpeg -i input.mp4 -ss 00:00:00 -to 00:44:03 -async 1 output.mp4
[start time to end time]

## Quick Trim Video
* * *
 ffmpeg -ss 00:01:00 -i input.mp4 -to 00:02:00 -c copy output.mp4





