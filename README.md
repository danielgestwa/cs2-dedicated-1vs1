# Counter Strike 2 dedicated server with default workshop maps support

Based on dockerfile: https://github.com/joedwards32/CS2
I suppose it is trustworthy, as it is used in Valve dev docs: https://developer.valvesoftware.com/wiki/Counter-Strike_2/Dedicated_Servers#Docker

There are two folders in bin: maps and configs. First one contains maps downloaded from workshop, downloading instructions below. Second one conatins .cfg files for server custom setup.

<b>This repository was created for quick LAN party setup with Workshop map examples. If you want to use it over internet, I suggest to use VPN tunneling. Using open port on Your router with docker-compose and turned off firewall is probably a big security issue. You can also setup API Steam key and set password for your server, but I didn't tested that at all</b>

## How to run it?

1. Install docker and docker-compose software on your machine or computer in your network. Remember to open ports on Your server firewall (default is 27015 both on TCP and UDP). I used some lenovo minipc with Ubuntu server and UFW disabled.
2. Clone or download this repository and type "docker compose up -d" in proper folder, if it fails then add "sudo" at the beggining.
3. Wait for cs2 server to be installed. You can check that by typing "docker ps | grep cs2". It will display list of running containers. Copy it's id and type "docker logs <container_id>", e.g. "docker logs 2e29d2f5bbc2". Adding "sudo" might be required. Full install on 150 MBps connection should take around 1h.
4. Open CS2 client, open console (by clicking ~, you have to enable it manually in settings) and type "connect <your-server-ip". In my case that was "connect 127.0.0.1" on my local machine, and "connect 192.168.0.149" on my second PC in same network. You can also specify port different than default one "connect <server-ip>:<server-port>"

## Maps

Default map added to this project: https://steamcommunity.com/sharedfiles/filedetails/?id=3108880806

If you want to use another map, then open Your Steam client and subscribe it in workshop.
After download is finished it should appear in Steam/steamapps/workshop/content/730 (same folder name as id parameter in url).
Copy newly downloaded folder to this bin/maps project, and change MAP value (in docker-compose.yml) to proper id (same as folder name and id parameter in url).

## Configs

If you want to change default config then add another .cfg file to configs folder. After that change CFG value in docker-compose.yml to newly added file.
If you want to use default game config then comment 17 and 19 line in Dockerfile file (it's truncating server.cfg file and adds one that you added).
You can also change CS2_GAMEALIAS (or CS_GAMETYPE and CS_GAMEMODE) at line 47 for proper default settings (in Dockerfile too).

## More servers, updating changes

If you want to, you can run multiple local servers, just copy cs2m1 structure and paste it once again, as e.g. cs2m2.
You have to change default PORT and server NAME too. I think you would want to change other settings, like MAX_PLAYERS anyway.
After changes in docker-compose.yml, running "docker compose up -d" should update container. If you changed Dockerfile, you might need to run "docker compose build <service-name>", e.g. "docker compose build cs2m1" and then "docker-compose up -d".

Have fun!
