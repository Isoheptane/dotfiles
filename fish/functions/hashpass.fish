function hashpass
	read -s password
	set -f hash (printf $password | sha256sum | cut -d " " -f 1 | xxd -r -p | base64 | cut -b 32-)
	printf "C7c$hash" | wl-copy
end
