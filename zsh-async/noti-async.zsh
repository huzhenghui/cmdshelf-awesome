#!/usr/bin/env zsh

NOTI_WORKER_LAUNCH=0

noti-async-completed-callback() {
	echo $3 | noti -t $1 -m -
}

noti-async-job() {
	if [[ "${NOTI_WORKER_LAUNCH}" -eq 0 ]]; then
		echo "First launch noti worker"
		async_start_worker noti-worker -n
		async_register_callback noti-worker noti-async-completed-callback
		NOTI_WORKER_LAUNCH=1
	fi
	async_job noti-worker $@
}