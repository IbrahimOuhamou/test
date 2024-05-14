//بسم الله الرحمن الرحيم
//la ilaha illa Allah Mohammed Rassoul Allah
const std = @import("std");
const c = @cImport({
    @cInclude("SDL2/SDL.h");
});

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    try stdout.print("بسم الله الرحمن الرحيم\n", .{});
    try bw.flush(); // don't forget to flush!

    _ = c.SDL_Init(c.SDL_INIT_VIDEO);
    const window = c.SDL_CreateWindow("la ilaha illa Allah", c.SDL_WINDOWPOS_CENTERED, c.SDL_WINDOWPOS_CENTERED, 1200, 800, c.SDL_WINDOW_SHOWN | c.SDL_WINDOW_RESIZABLE);
    if (null == window) {
        c.SDL_LogError("Error c.SDL_CreateWindow() %s\n", c.SDL_GetError());
        unreachable;
    }
    const renderer = c.SDL_CreateRenderer(window, -1, c.SDL_RENDERER_PRESENTVSYNC);
    if (null == renderer) {
        c.SDL_Log("Error c.SDL_CreateRenderer() %s\n", c.SDL_GetError());
    }
    var running: bool = true;
    while (running) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {}
        switch (event.type) {
            c.SDL_QUIT => running = false,
        }

        c.SDL_SetRenderDrawColor(renderer, 100, 100, 100, 255);
        c.SDL_RenderClear(renderer);
        c.SDL_RenderPresent(renderer);
    }
    c.SDL_DestroyRenderer(renderer);
    c.SDL_DestroyWindow(window);
    c.SDL_Quit();
}
