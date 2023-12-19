from joedwards32/cs2

EXPOSE 27015/tcp
EXPOSE 27015/udp

COPY bin /home/

RUN echo 'cat /home/configs/1vs1.cfg >> /home/steam/cs2-dedicated/game/csgo/cfg/gamemode_competitive_server.cfg' >> /home/steam/cs2-dedicated/pre.sh
RUN echo 'cp -r /home/maps/* /home/steam/steamapps/workshop/content/730/' >> /home/steam/cs2-dedicated/pre.sh

# Server configuration
# Game Server Token from https://steamcommunity.com/dev/managegameservers
# ENV SRCDS_TOKEN=
# (Set the visible name for your private server)
ENV CS2_SERVERNAME=pVp_1vs1_PL
# (CS2 server listen port tcp_udp)
ENV CS2_PORT=27015
# (Put server in a low CPU state when there are no players. 0 ENV hibernation disabled, 1 ENV hibernation enabled)
ENV CS2_SERVER_HIBERNATE=1
# (Optional, use a simple TCP proxy to have RCON listen on an alternative port. Useful for services like AWS Fargate which do not support mixed protocol ports.)
# ENV CS2_RCON_PORT
# (0 ENV LAN mode disabled, 1 ENV LAN Mode enabled)
ENV CS2_LAN=1
# (RCON password)
ENV CS2_RCONPW=""
# (CS2 server password)
ENV CS2_PW=""
# (Max players)
ENV CS2_MAXPLAYERS=10
# (Optional additional arguments to pass into cs2)
ENV CS2_ADDITIONAL_ARGS="+host_workshop_map 3108880806"

# Game modes
# (Game type, e.g. casual, competitive, deathmatch. See https://developer.valvesoftware.com/wiki/Counter-Strike_2/Dedicated_Servers)
ENV CS2_GAMEALIAS=competitive
# (Used if CS2_GAMEALIAS not defined. See https://developer.valvesoftware.com/wiki/Counter-Strike_2/Dedicated_Servers)
ENV CS2_GAMETYPE=0
# (Used if CS2_GAMEALIAS not defined. See https://developer.valvesoftware.com/wiki/Counter-Strike_2/Dedicated_Servers)
ENV CS2_GAMEMODE=1
# (Map pool)
ENV CS2_MAPGROUP=mg_active
# (Start map)
ENV CS2_STARTMAP=de_dust2

# Bots
# (0 ENV easy, 1 ENV normal, 2 ENV hard, 3 ENV expert)
# ENV CS2_BOT_DIFFICULTY=2
# (Number of bots)
# ENV CS2_BOT_QUOTA
# (fill, competitive)
# ENV CS2_BOT_QUOTA_MODE
      
# TV
# Automatically records all games as CSTV demos: 0=off, 1=on.
ENV TV_AUTORECORD=0
# Activates CSTV on server: 0=off, 1=on.
ENV TV_ENABLE=0
# Host SourceTV port
# ENV TV_PORT=27020
# CSTV password for clients
# ENV TV_PW=
# CSTV password for relay proxies
# ENV TV_RELAY_PW=
# World snapshots to broadcast per second. Affects camera tickrate.
ENV TV_MAXRATE=0
# Max CSTV spectator bandwidth rate allowed, 0 == unlimited
ENV TV_DELAY=0