#pragma semicolon 1;
#include <cstrike>
#include <sourcemod>
#include <sdktools>

new bool:enbhop = true;

public Plugin:myinfo = {
    name = "Ez Bhop",
    author = "YuXiaoyu",
    description = "Fast change sv_autobunnyhop",
    version = "1.0",
    url = "https://yu.hi.cn"
};

public OnPluginStart() {
    RegAdminCmd("sm_bhop", Command_Enbhop, ADMFLAG_GENERIC, "En/Disable bhop");
}

public OnMapStart() {
    enbhop = true;
}

public Action:Command_Enbhop(client, args) {
    if(enbhop == true) {
        ServerCommand("sv_autobunnyhopping 1");
        PrintToChatAll("Admin\x04 %N \x01Enable AutoBunnyhop", client);
        enbhop = false;
        return Plugin_Handled;
    }
    else if(enbhop == false) {
        ServerCommand("sv_autobunnyhopping 0");
        PrintToChatAll("Admin\x04 %N \x01Disable AutoBunnyhop", client);
        enbhop = true;
        return Plugin_Handled;
    }
    return Plugin_Handled;
}