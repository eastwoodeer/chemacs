(defvar chemacs--last-emacs-version ""
  "This variable is set during Emacs initialization to its version")

(defconst chemacs--last-emacs-version-file
  (expand-file-name (concat chemacs-cache-directory "chemacs-last-emacs-version"))
  "File that sets `chemacs--last-emacs-version' variable")

(defun chemacs//update-last-emacs-version ()
  "Update `chemacs--last-emacs-version' and its saved value."
  (with-temp-file chemacs--last-emacs-version-file
    (insert (format "(setq chemacs--last-emacs-version %S)"
                    (setq chemacs--last-emacs-version emacs-version)))
    (make-directory (file-name-directory chemacs--last-emacs-version-file)
                    t)))

(provide 'core-compilation)
