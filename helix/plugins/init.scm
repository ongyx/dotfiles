(require (prefix-in helix. "helix/commands.scm"))
(require (prefix-in helix.static. "helix/static.scm"))
(require "helix/configuration.scm")
(require "helix/keymaps.scm")
(require "helix/commands.scm")

(require "trail/trail.scm")
(require "scooter/scooter.scm")
(require "forest/forest.scm")

(keymap (global)
  (normal (space (e ":forest-open"))))

(keymap (global)
  (normal (space (p ":trail-open"))))

(keymap (global)
  (normal (space (S ":scooter"))))
