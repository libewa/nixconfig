{pkgs, ...}: {
  xdg.configFile.yt-dlp = {
    target = "yt-dlp/config";
    text = ''
      --embed-subs --embed-chapters --embed-thumbnail
      --sub-langs "de|en.*|ja"
      -f "bv*[ext=mp4][height<=1080]+ba[ext=m4a]/b[ext=mp4] / bv*[height<=1080]+ba/b"
      -o "%(uploader)s: %(title)s [%(id)s].%(ext)s"
      --sponsorblock-remove sponsor --sponsorblock-remove music_offtopic --sponsorblock-remove selfpromo
      --no-write-comments
      -P "temp:tmp"
      -N2
      --restrict-filenames
    '';
  };
  home.packages = [pkgs.yt-dlp];
}
