{ pkgs, ... }: {
    home.pointerCursor = {
        package = pkgs.posy-cursors;
        name = "Posy_Cursor";
        gtk.enable = true;
        hyprcursor = {
            enable = true;
            size = 32;
        };
        size = 32;
        x11.enable = true;
    };
}