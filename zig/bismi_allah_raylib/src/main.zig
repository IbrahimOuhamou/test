//بسم الله الرحمن الرحيم
//la ilaha illa Allah Mohammed Rassoul Allah

const std = @import("std");
const rl = @import("raylib");

pub fn main() anyerror!void {
    std.debug.print("بسم الله الرحمن الرحيم", .{});

    rl.initWindow(800, 450, "بسم الله الرحمن الرحيم");
    defer rl.closeWindow();

    rl.setTargetFPS(60);
    var bismi_allah_rec = rl.Rectangle{
        .x = 10,
        .y = 10,
        .width = 10,
        .height = 10,
    };
    var speed: f32 = 1;

    while (!rl.windowShouldClose()) {
        if (rl.isKeyDown(rl.KeyboardKey.key_right)) bismi_allah_rec.x += speed;
        if (rl.isKeyDown(rl.KeyboardKey.key_left)) bismi_allah_rec.x -= speed;
        if (rl.isKeyDown(rl.KeyboardKey.key_up)) bismi_allah_rec.y -= speed;
        if (rl.isKeyDown(rl.KeyboardKey.key_down)) bismi_allah_rec.y += speed;
        if (rl.isKeyDown(rl.KeyboardKey.key_left_shift)) {
            speed = 5;
        } else {
            speed = 1;
        }
        if (rl.isKeyDown(rl.KeyboardKey.key_equal) or rl.isKeyDown(rl.KeyboardKey.key_kp_add)) {
            bismi_allah_rec.width += 1;
            bismi_allah_rec.height += 1;
        } else if (rl.isKeyDown(rl.KeyboardKey.key_minus)) {
            bismi_allah_rec.width -= 1;
            bismi_allah_rec.height -= 1;
        }

        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.ray_white);
        rl.drawRectangleRec(bismi_allah_rec, rl.Color.gray);
    }
}
