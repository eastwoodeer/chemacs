;;; core-debug.el --- chemacs Core File  -*- lexical-binding: t; -*-

(defun chemacs//timed-initialize (orig-func &rest args)
  "Time the invocation of `package-initialize' and return the time in seconds.
ORIG-FUNC must be `package-initialize', ARGS are arguments passed to it."
  (let ((start (current-time))
		delta)
	(prog1
		(apply orig-func args)
	  (setq delta (float-time (time-since start)))
	  (when (> delta 0)
		(with-current-buffer (get-buffer-create "*load-times*")
		  (goto-char (point-max))
		  (insert (format "package-initialize took %.3f sec\n" delta)))))))


(provide 'core-debug)
