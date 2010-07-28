;; tabbing
(setq-default tab-width 4 indent-tabs-mode nil)

;; align
(require 'align)

;; auto-insert
(require 'autoinsert)
(add-hook 'find-file-not-found-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/insert/")
(setq auto-insert-query nil)
(setq auto-insert-alist nil)

;; browse-kill-ring
(autoload 'browse-kill-ring "browse-kill-ring" nil t)
(load "browse-kill-ring+")
(define-key global-map (kbd "M-y") 'browse-kill-ring)
(setq kill-do-not-save-duplicates t)

;; undo/redo
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-mode-lighter nil)
