useradd michael -m -p 3457275 && echo "michael ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
mkdir /home/michael/.ssh
chmod 700 /home/michael/.ssh
cat <<'EOT' > /home/michael/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDv+b8tqykFYqcfaK1wsFFvJuCpDABYK1OHeSFxIP9ePV2rlFb00L1b69ZQn0WbF8WMgTj2FNHk4mzOJBVRbkT8i76tORwSTY1y+05ttB8pbS9ues+EnSuXe0qYj43w8ziYpf1ZUWugI1FbQ9m2zeAWoK8yRgn9c51Vo9dJ+ae1Erj9a6ISH+EGXTTyvjE5u8JJap5mCeBMrUxzoo0FJWowBLML7qV3ww9Mdl/uhhRnjHyMtZ4rP82qf4ySCW8fv2pldurhXnTTz0GJn7Xw3AROq4mnp+0jv/9jJ9S7w7jenNiRzgYm6aSFvskkG3yk/vXGvo6rl1Glm6ZYLmNB/AIGeCKXEM0OmNIwUV2Ek305stO0n1g8lfbj7hFGzvNv+D8NQm90aSULn5dUx+af5bj935G0uaXOXZwXHi2bJ+l5pgtgmmlcZ2xxv7PwwVVAfwJhgma/QgVeIoc+RDU2IDIhoCU83WTXp/qg/sB/n3YxhvnRGszSkOF0A4GjrHTvt28= michael@hf-book

EOT
chmod 600 /home/michael/.ssh/authorized_keys
chown michael:michael -R /home/michael/.ssh/
yum install -y epel-release
yum -y update
yum install -y docker docker-compose screen tor proxychains-ng
setfacl -m user:michael:rw /var/run/docker.sock
systemctl enable docker.service --now
systemctl start tor.service
