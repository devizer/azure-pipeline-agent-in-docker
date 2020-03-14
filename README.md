### azure-pipeline-agent-in-docker
azure pipeline agent in docker for armv7, arm64 and x86_64

### Key features
- Preconfigured SystemD. Intended for background services testing. 
- Azure pipelines agent configured as SystemD service.
- Preinstalled latest Docker client with experimental features suck as buildx.
- Preconfigured `en_US.UTF8` as LC_ALL and LANG.
- Preinstalled latest .net core, mono, node, nunit & xunit test runners, etc.
- Supported 3 architectures: armv7 (native), arm64 (arm32 binaries with armhf dependencies) and x86_64 (native).
  
### create container and configure azure pipeline agent
```
docker run -d --restart on-failure --privileged \
 --name agent007 \
 --hostname agent007 \
 -v /sys/fs/cgroup:/sys/fs/cgroup \
 -v /var/run/docker.sock:/var/run/docker.sock \
 devizervlad/crossplatform-azure-pipelines-agent:latest

docker exec -it agent007 bash -c '
 export VSTS_URL="https://devizer.visualstudio.com/";
 export VSTS_PAT=<your agent pool token>;
 export VSTS_POOL=my-pool;
 export VSTS_AGENT=my-agent-007; 
 export VSTS_WORK=work;
 /pre-configure/config-agent.sh'
```
