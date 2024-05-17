//بسم الله الرحمن الرحيم
//la ilaha illa Allah Mohammed Rassoul Allah

//! # raylib-zig [core] example - window flags
//!
//! Example originally created with raylib-zig 5.0, last time updated with
//! raylib-zig 5.0
//!
//! Example licensed under an unmodified zlib/libpng license, which is an
//! OSI-certified, BSD-like license that allows static linking with closed
//! source software
//!
//! Copyright (c) Nikolas Wipper 2024

const rl = @import("raylib");
const rlm = @import("raylib-math");

const screen_width = 800;
const screen_height = 450;

pub fn main() anyerror!void {
    // Initialization
    // -------------------------------------------------------------------------

    // Possible window flags
    // flag_vsync_hint
    // flag_fullscreen_mode    -> not working properly -> wrong scaling!
    // flag_window_resizable
    // flag_window_undecorated
    // flag_window_transparent
    // flag_window_hidden
    // flag_window_minimized   -> Not supported on window creation
    // flag_window_maximized   -> Not supported on window creation
    // flag_window_unfocused
    // flag_window_topmost
    // flag_window_highdpi     -> errors after minimize-resize, fb size is recalculated
    // flag_window_always_run
    // flag_msaa_4x_hint

    // Set configuration flags for window creation
    // rl.setConfigFlags(
    //     @enumFromInt(@intFromEnum(rl.ConfigFlags.flag_vsync_hint) | @intFromEnum(rl.ConfigFlags.flag_msaa_4x_hint) | @intFromEnum(rl.ConfigFlags.flag_window_highdpi)),
    // );
    rl.initWindow(
        screen_width,
        screen_height,
        "بسم الله الرحمن الرحيم",
    );
    defer rl.closeWindow(); // Close window and OpenGL context

    //const bismi_allah_font = rl.loadFont("resources/fonts/KacstPoster.ttf");
    //const bismi_allah_font = rl.loadFont("resources/fonts/SourceSans3-Regular.ttf");
    //if (!rl.isFontReady(bismi_allah_font)) unreachable;

    rl.setTargetFPS(60); // Set our game to run at 60 frames-per-second

    while (!rl.windowShouldClose()) {
        // Update
        // ---------------------------------------------------------------------
        // ---------------------------------------------------------------------

        // Draw
        // ---------------------------------------------------------------------
        {
            rl.beginDrawing();
            defer rl.endDrawing();

            rl.clearBackground(rl.Color.white);

            rl.drawText("la ilaha illa Allah Mohammed Rassoul Allah", 40, 30, 32, rl.Color.black);

            //rl.drawTextEx(bismi_allah_font, "bismi Allah", .{ .x = 40, .y = 50 }, 32, 5, rl.Color.blue);
        }
        // ---------------------------------------------------------------------
    }
}
