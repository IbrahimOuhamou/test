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
        c.SDL_LogError(0, "Error c.SDL_CreateWindow() %s\n", c.SDL_GetError());
        unreachable;
    }
    const renderer = c.SDL_CreateRenderer(window, -1, c.SDL_RENDERER_PRESENTVSYNC);
    if (null == renderer) {
        c.SDL_Log("Error c.SDL_CreateRenderer() %s\n", c.SDL_GetError());
        unreachable;
    }

    var bismi_allah_rect = c.SDL_Rect{
        .x = 10,
        .y = 10,
        .w = 30,
        .h = 30,
    };

    var running: bool = true;
    while (running) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event) != 0) {
            if (c.SDL_QUIT == event.type) {
                running = false;
            } else if (c.SDL_KEYDOWN == event.type) {
                bismi_allah_rect.w += 10;
                if(c.SDLK_RIGHT == )
                try stdout.print("alhamdo li Allah event: {any}\n", .{event.key.keysym.scancode});
            }
        }

        _ = c.SDL_SetRenderDrawColor(renderer, 100, 100, 100, 255);
        _ = c.SDL_RenderClear(renderer);
        _ = c.SDL_SetRenderDrawColor(renderer, 30, 30, 200, 100);
        _ = c.SDL_RenderFillRect(renderer, &bismi_allah_rect);
        _ = c.SDL_RenderPresent(renderer);
    }
    c.SDL_DestroyRenderer(renderer);
    c.SDL_DestroyWindow(window);
    c.SDL_Quit();
}
