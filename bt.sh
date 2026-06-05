#!/bin/bash
mkdir tracker
cd tracker
## 列表文件名
LIST="tracker.txt"
## 临时文件处理
trap 'rm -f "${TMPFILE}"' EXIT
TMPFILE=$(mktemp)
## 获取列表内容并合并,可按照格式自行添加列表
## 活跃源：XIU2(每日更新), ngosang(每日更新), itzmx, newtrackon, 迅雷, trackerslist.com, DeSireFire(停更但仍可访问)
## 已移除：t.acg.rip(连接失败), yaozuopan.top(站点挂了)
curl -k {https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt,\
https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/best.txt,\
https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/http.txt,\
https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/nohttp.txt,\
http://github.itzmx.com/1265578519/OpenTracker/master/tracker.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_udp.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_http.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_https.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ws.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best_ip.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all_udp.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all_https.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all_http.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all_ws.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all_ip.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_best.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_best_ip.txt,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_bad.txt,\
https://trackerslist.com/all.txt,\
https://newtrackon.com/api/live,\
http://plugin.xl7.xunlei.com/7.9/normal/trackers.json} > ${TMPFILE}
## 对列表排序并去重
grep -Po '(udp|https?|wss?)://.+?/announce(.php)?' ${TMPFILE} | sort -u -o ${LIST}
