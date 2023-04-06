import paramiko
from scp import SCPClient

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh.connect(hostname='194.26.138.107', 
            port = '443',
            username='root')

scp = SCPClient(ssh.get_transport())
scp.put(f'.\\provision.sh', recursive=True, remote_path='/root')
scp.put(f'.\\docker-compose.yml', recursive=True, remote_path='/root')
scp.close()
ssh.exec_command('chmod +x /opt/provision.sh')
_stdin, _stdout,_stderr = ssh.exec_command('ls -la /opt/provision.sh')
print(_stdout.read().decode())
ssh.close()
input()