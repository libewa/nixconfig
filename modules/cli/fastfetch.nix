{
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
	"separator"
	"os"
	"host"
	"kernel"
	"uptime"
	"shell"
	"de"
	"wm"
	"wmtheme"
	"theme"
	"cursor"
	"terminal"
	"locale"
	"separator"
	"cpu"
	"gpu"
	"memory"
	"swap"
	"disk"
	"localip"
	"battery"
	"poweradapter"
      ];
      display = {
        temp = {
	  unit = "CELSIUS";
	  ndigits = 0;
	};
	size = {
	  maxPrefix = "PB";
	  ndigits = 2;
	};
      };
      logo.printRemaining = true;
    };
  };
}
