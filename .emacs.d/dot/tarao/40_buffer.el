;; auto-save
(defun auto-save-buffer (&optional buffer)
  (interactive)
  (unless buffer (setq buffer (current-buffer)))
  (save-excursion
    (set-buffer buffer)
    (if (and buffer-file-name
         (buffer-modified-p)
             (not buffer-read-only)
             (file-writable-p buffer-file-name))
        (save-buffer))))

;; no backup
(defun no-backup ()
  (interactive)
  (set (make-variable-buffer-local 'make-backup-files) nil)
  (auto-save-mode 0))
