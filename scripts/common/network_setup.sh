#!/bin/bash
function test_network_connection {
	ping www.baidu.com -c 1 2>/dev/null | grep ttl || ntmui
}
