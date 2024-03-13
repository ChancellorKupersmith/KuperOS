{ pkgs }:

pkgs.writeShellScriptBin "jarvis-start" ''
  llama -m "$HOME/sosa_baby/LocalAI/models/dolphin-2.7-mixtral-8x7b.Q3_K_M.gguf" --color -n 128 --interactive -ins --n-gpu-layers 25
''
