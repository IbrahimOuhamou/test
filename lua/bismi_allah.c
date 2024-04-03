//in the name of Allah
//la ilaha illa Allah mohammed rassoul Allah

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <stdio.h>

int main()
{
    printf("in the name of Allah\n");

    int bismi_allah_a = 99;

    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    luaL_openlibs(L);
    luaL_dostring(L, "print(\"[lua] in the name of Allah\")");
    luaL_dostring(L, "print(\"[lua] la ilaha illa Allah mohammed rassoul Allah\")");

    lua_newtable(L);
    lua_setglobal(L, "bismi_allah_table");

    lua_getglobal(L, "bismi_allah_table");
    lua_newtable(L);
    lua_pushstring(L, "la ilaha illa Allah mohammed rassoul Allah");
    lua_setfield(L, -2, "var");
    lua_setfield(L, -2, "bismi_allah_subtable");

    lua_pushlightuserdata(L, &bismi_allah_a);
    lua_setglobal(L, "bismi_allah_a");

    lua_getglobal(L, "bismi_allah_a");
    printf("[C] its type is '%s'\n", lua_typename(L, lua_type(L, -1)));

    int *bismi_allah_addr = lua_touserdata(L, -1);
    printf("[C] bismi_allah_a == %d\n", *bismi_allah_addr);
    bismi_allah_addr = lua_topointer(L, -1);
    printf("[C] bismi_allah_a == %d\n", *bismi_allah_addr);

    luaL_dofile(L, "bismi_allah.lua");
}

