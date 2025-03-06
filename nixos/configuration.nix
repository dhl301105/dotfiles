{ config, pkgs, ... }:

{ 
  programs.git = {
    enable = true;
    userName  = "dhl301105";
    userEmail = "dhl301105@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines =with pkgs.ibus-engines; [ Bamboo ];
 };

  nixpkgs.config = {
    allowUnfree = true;
  };
  
  environment.systemPackages = with pkgs; [
    neovim
    jetbrains.idea-ultimate
    git
    foot
    waybar
    hyprpaper
    jetbrains.pycharm-community-bin
    jetbrains.idea-community-bin
		jetbrains.clion
		vscode
		krita
		kdePackages.kdenlive
		google-chrome
		rofi-wayland
		gimp
		fd
    jq
    fzf
    ripgrep
    curl
    wget
    exa 
    neofetch
    zoxide
    unzip
    zip
    gcc
    cliphist
    nautilus
  ];

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  services.libinput.enable = true;

  qt.enable = true;
  qt.platformTheme = "gtk4";
  qt.style = "gtk4";
  
	programs.hyprland.enable = true;

  hardware.graphics.extraPackages = [
    libva-utils
  ];

  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" ];
  networking.hostName = "nixos";
  networking.firewall.enable = false;
	networking.wireless.enable = true;

  services.openssh.enable = false; 
  services.openssh.permitRootLogin = "no";
  services.openssh.passwordAuthentication = true;
  AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
  UseDns = true; 
  users.users.alice.openssh.authorizedKeys.keys =
    [ "ssh-ed25519 AAAAB3NzaC1kc3MAAACBAPIkGWVEt4..." ];

  boot.kernelPatches = [
    {
      name = "Rust Support";
      patch = null;
      features = {
        rust = true;
      };
    }
  ];

	time.timeZone = "Asia/Ho_Chi_Minh";

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.fish.enable = true;

  programs.bash = { 
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; 
  services.blueman.enable = true;


}