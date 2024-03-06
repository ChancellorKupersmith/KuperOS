{ pkgs }:

pkgs.writeShellScriptBin "getPlayingSong" ''
  song_info=$(playerctl metadata --format '{{title}}  {{artist}}')
  echo "$song_info" 
''
