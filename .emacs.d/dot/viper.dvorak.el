(setq viper-fast-keyseq-timeout 0)
(setq viper-expert-level 3)
(setq viper-case-fold-search t)
(setq viper-inhibit-startup-message t)
(setq viper-u-always-undo t)
(define-key viper-insert-global-user-map
  (kbd "C-w") 'kill-region)
(define-key viper-visual-map
  (kbd ";") (lambda () (interactive) (viper-ex t)))
(define-key viper-vi-basic-map
  (kbd ";") 'viper-ex)
(define-key viper-vi-global-user-map
  (kbd ":") 'anything)
(define-key viper-vi-global-user-map
  (kbd "d") 'viper-backward-char)
(define-key viper-vi-global-user-map
  (kbd "h") 'viper-next-line)
(define-key viper-vi-global-user-map
  (kbd "t") 'viper-previous-line)
(define-key viper-vi-global-user-map
  (kbd "n") 'viper-forward-char)
(define-key viper-vi-global-user-map
  (kbd "H") 'viper-scroll-up)
(define-key viper-vi-global-user-map
  (kbd "T") 'viper-scroll-down)
(define-key viper-vi-global-user-map
  (kbd "s") 'viper-search-next)
(define-key viper-vi-global-user-map
  (kbd "S") 'viper-search-Next)
(define-key viper-vi-global-user-map
  (kbd "k") 'viper-command-argument)
(defvar viper-prefix-command-map
  '((?k . ?d)))

(defadvice viper-prefix-arg-com
  (around viper-prefix-command-replace first (char value com) activate)
  (setq char (or (cdr (assq char viper-prefix-command-map)) char))
  ad-do-it)

(defun my-viper-beginning-of-buffer ()
  (interactive)
  (beginning-of-buffer))
(define-key viper-vi-global-user-map [?g?g] 'my-viper-beginning-of-buffer)

(defun my-viper-star ()
  (interactive)
  (let ((wd (concat "\\<" (thing-at-point 'symbol) "\\>")))
    (setq viper-s-string wd)
    (setq viper-s-forward t)
    (viper-search wd t 1)))
(define-key viper-vi-global-user-map (kbd "*") 'my-viper-star)

(defun my-viper-jump-tag ()
  (interactive)
  (setq wd (thing-at-point 'symbol))
  (find-tag wd))
(define-key viper-vi-global-user-map (kbd "C-]") 'my-viper-jump-tag)

(defun my-viper-jump-tag-next ()
  (interactive)
  (setq wd (thing-at-point 'symbol))
  (find-tag wd 0))
(define-key viper-vi-global-user-map (kbd "C-:") 'my-viper-jump-tag-next)

(defun my-viper-pop-tag ()
  (interactive)
  (pop-tag-mark))
(define-key viper-vi-global-user-map (kbd "C-t") 'my-viper-pop-tag)

(defun my-viper-pop-mark ()
  (interactive)
  (set-mark-command -1))
(define-key viper-vi-global-user-map (kbd "C-o") 'my-viper-pop-mark)

;; dired
(define-key viper-dired-modifier-map "h" 'dired-next-line)
(define-key viper-dired-modifier-map "t" 'dired-previous-line)
(define-key viper-dired-modifier-map "/" 'dired-goto-file)
(define-key viper-dired-modifier-map "n"
  '(lambda () (interactive) (dired-next-line 10)))
(define-key viper-dired-modifier-map "d"
  '(lambda () (interactive) (dired-previous-line 10)))