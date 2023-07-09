function hashpass
	read password
	echo "$password"
	set -f hash (printf $password | sha256sum | cut -d " " -f 1 | xxd -r -p | base64 | cut -b 32-)
	echo "C7c$hash"
end
