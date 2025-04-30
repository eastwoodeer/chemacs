(require 'core-debug)

(defun chemacs//toggle-gui-elements (&optional on-off)
  "Toggle menu bar, tool bar, scroll bars, and tool tip modes.
If optional ON-OFF is not specified, then toggle on/off state.
If ON-OFF is 0 or 1, then turn gui elements OFF or ON respectively."
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode (or on-off (if scroll-bar-mode 0 1))))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode (or on-off (if tool-bar-mode 0 1))))
  (unless (memq (window-system) '(mac ns))
    (when (fboundp 'menu-bar-mode)
      (menu-bar-mode (or on-off (if menu-bar-mode 0 1)))))
  (when (fboundp 'tooltip-mode)
    (tooltip-mode (or on-off (if tooltip-mode 0 1)))))

(defun chemacs/init ()
  (chemacs//toggle-gui-elements 0))

(provide 'core-chemacs)
