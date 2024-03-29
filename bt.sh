##!/bin/bash
mkdir tracker
cd tracker
## 列表文件名
LIST="tracker.txt"
## 临时文件处理
trap 'rm -f "${TMPFILE}"' EXIT
TMPFILE=$(mktemp)
## 获取列表内容并合并,可按照格式自行添加列表
curl -k {https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt,\
http://github.itzmx.com/1265578519/OpenTracker/master/tracker.txt,\
https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt,\
http://t.acg.rip:6699/announce,\
https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all.txt,\
https:trackerslist.com/all.txt\
https://www.yaozuopan.top/dynamic/trackerlist.txt,\
https://newtrackon.com/api/live,\
http://plugin.xl7.xunlei.com/7.9/normal/trackers.json} > ${TMPFILE}
## 对列表排序并去重
grep -Po '(udp|https?|wss?):\/\/.+?\/announce(\.php)?' ${TMPFILE} | sort -u -o ${LIST}
