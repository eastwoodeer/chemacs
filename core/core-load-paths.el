
;; ~/.chemacs/
(defvar chemacs-start-directory
  (expand-file-name "../" (file-name-directory (or load-file-name buffer-file-name)))
  "chemacs start directory.")

;; ~/.chemacs/core/
(defvar chemacs-core-directory
  (concat chemacs-start-directory "core/")
  "chemacs core directory.")

;; ~/.emacs.d/.cache/
(defvar chemacs-cache-directory
  (concat user-emacs-directory ".cache/")
  "chemacs storage area for persistent files.")

(dolist (subdirectory '(nil))
  (let ((path (concat chemacs-core-directory subdirectory)))
    (if (file-exists-p path)
        (add-to-list 'load-path path)
      (error "The directory %s does not exist and cannot be added to the `load-path'." path))))

(provide 'core-load-paths)
