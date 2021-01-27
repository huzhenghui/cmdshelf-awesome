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

watch-ps() {
	if [[ "${#}" -eq 2 ]]; then
		WATCH_PS_PID="${1}"
		MESSAGE="${2}"
	else
		echo "Usage:"
		echo "\t${0} WATCH_PS_PID MESSAGE"
		return 45
	fi
	watch -x -i 1 ps -p "${WATCH_PS_PID}" 1>/dev/null 2>/dev/null
	echo "${MESSAGE}"
}

noti-async-watch-ps-by-pid() {
	if [[ "${#}" -eq 1 ]]; then
		WATCH_PS_PID="${1}"
	else
		echo "Usage:"
		echo "\t${0} WATCH_PS_PID"
		return 30
	fi
	noti-async-job watch-ps "${WATCH_PS_PID}" "Process ${WATCH_PS_PID} Finished."
}

noti-async-watch-ps-by-pattern() {
	if [[ "${#}" -ge 1 ]]; then
		PROCESS_PATTERN="${@}"
	else
		echo "Usage:"
		echo "\t${0} PROCESS_PATTERN"
		return 57
	fi
	PIDS="$(pgrep -f "${PROCESS_PATTERN}")"
	PID_COUNT="$(echo "$PIDS" | grep -e "^[0-9]\+$" | wc -l)"
	if [[ "${PID_COUNT}" -ne 1 ]]; then
		echo "Found ${PID_COUNT} match pattern ${PROCESS_PATTERN}" 1>&2
		echo 1>&2
		pgrep -l -f "${PROCESS_PATTERN}" 1>&2
		return 33
	fi
	noti-async-job watch-ps "${PIDS}" "Process ${PROCESS_PATTERN} Finished."
}