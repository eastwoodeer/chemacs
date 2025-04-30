(defconst emacs-start-time (current-time))
(setq gc-cons-threshold 402653184 gc-cons-percentage 0.6)

(message "--> %s" load-file-name)
(load (concat (file-name-directory load-file-name) "core/core-load-paths")
      nil (not init-file-debug))

(load (concat chemacs-core-directory "core-versions")
      nil (not init-file-debug))

(load (concat chemacs-core-directory "core-compilation")
      nil (not init-file-debug))

(load chemacs--last-emacs-version-file t (not init-file-debug))
(unless (string= chemacs--last-emacs-version emacs-version)
  (chemacs//update-last-emacs-version))

(if (not (version<= chemacs--emacs-min-version emacs-version))
    (error (concat "Your version of Emacs (%s) is too old. "
                   "chemacs requires Emacs version %s or above.")
           emacs-version
           chemacs--emacs-min-version)
  (require 'core-chemacs)
  (chemacs/init))

(message "----> %s |%s|" chemacs--version chemacs--last-emacs-version)
