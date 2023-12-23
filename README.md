# Counter Strike 2 Dedicated Server with Default Workshop Maps Support

This repository hosts a Counter Strike 2 dedicated server setup, leveraging a Dockerfile from [joedwards32/CS2](https://github.com/joedwards32/CS2). This Dockerfile is referenced in Valve's development documentation ([Counter-Strike 2 Dedicated Servers](https://developer.valvesoftware.com/wiki/Counter-Strike_2/Dedicated_Servers#Docker)), providing reliability.

## Purpose

Primarily designed for quick LAN party setups, this repository showcases examples of Workshop maps. Note that for internet usage, it's recommended to implement VPN tunneling for security. Directly opening ports on your router, using docker-compose, and disabling firewalls could pose significant security risks. For advanced settings like setting up an API Steam key or server passwords, these are available but haven't been extensively tested.

## How to Run

1. **Prerequisites:** Install Docker and docker-compose on your machine or within your networked computer. Ensure that ports (default: 27015 TCP/UDP) are open on your server firewall. For instance, I used a Lenovo mini PC with Ubuntu Server and UFW disabled.
  
2. **Setup:** Clone or download this repository and navigate to the folder. Run `docker-compose up -d` (if unsuccessful, prepend with `sudo`).

3. **Installation Confirmation:** Confirm the CS2 server installation by executing `docker ps | grep cs2`. Retrieve the container's ID and check the installation logs via `docker logs <container_id>` (e.g., `docker logs 2e29d2f5bbc2`). Use `sudo` if required. Installation on a 150 Mbps connection typically takes around an hour.

4. **Connecting to Server:** Open the CS2 client, access the console (enable it manually in settings), and enter `connect <your-server-ip>`. For example, on a local machine, it might be `connect 127.0.0.1`, while on another PC in the same network, it could be `connect 192.168.0.149`. Optionally, specify a port different from the default one via `connect <server-ip>:<server-port>`.

## Maps

The repository includes two default maps:
- [Workshop Map 1](https://steamcommunity.com/sharedfiles/filedetails/?id=3108880806)
- [Workshop Map 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3104635007)

To incorporate the new map:

1. **Subscribe & Download:** Subscribe to the new map in your Steam client's workshop.
  
2. **Locate Downloaded Map:** After the download is complete, find the map in `Steam/steamapps/workshop/content/730` (the folder name corresponds to the ID parameter in the URL).
  
3. **Add to Repository:** Copy the newly downloaded folder to the `bin/maps` directory within this project.
  
4. **Update Configuration:** Modify the `MAP` value in `docker-compose.yml` to match the ID of the new map (same as the folder name and ID parameter in the URL). For example, using the ID `3104635007` in the `docker-compose.yml` file will integrate the newly added map into your server setup alongside the existing maps.

## Configs

For altering the default config:
- Add another `.cfg` file to the `configs` folder.
- Update the `CFG` value in `docker-compose.yml` to the newly added file.
- To retain the default game config, comment lines 17 and 19 in the `Dockerfile` (which truncates `server.cfg` and adds a new one).

To adjust default settings:
- Modify `CS2_GAMEALIAS` (or `CS_GAMETYPE` and `CS_GAMEMODE`) at line 47 in the `Dockerfile`.

## Running Multiple Servers & Updating Changes

To add the newly included map or update configurations:

- Duplicate the `cs2m1` structure to create another server setup named `cs2m3`.
  
- Customize settings like `PORT`, `NAME`, and others as needed, including adjusting `MAX_PLAYERS`.

To apply changes:

- After modifying the `docker-compose.yml` file, running `docker-compose up -d` will update the container to reflect alterations.

- For modifications in the `Dockerfile`, execute `docker-compose build cs2m3`, followed by `docker-compose up -d` to implement the changes specific to `cs2m3`.

Enjoy the gaming experience with the updated server configurations!
