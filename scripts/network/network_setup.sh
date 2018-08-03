#!/bin/bash
ping www.baidu.com -c 1 2>/dev/null | grep "ttl=" || nmtui
exit 0
