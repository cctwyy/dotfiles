(bundle tarao-elisp
  ;; shell command (with saving the last command for default value)
  (global-set-key (kbd "M-!") 'shell-command+)
  (global-set-key (kbd "M-|") 'shell-command-on-region+)

  ;; incremental completion in minibuffer
  (yaicomplete-mode))

;; zsh like completion
(setq read-file-name-completion-ignore-case t)
(bundle! zlc :url "http://github.com/mooz/emacs-zlc.git"
  (zlc-mode t)
  (let ((map minibuffer-local-map))
    (define-key map (kbd "C-p") 'zlc-select-previous)
    (define-key map (kbd "C-n") 'zlc-select-next)
    (define-key map (kbd "<up>") 'zlc-select-previous-vertical)
    (define-key map (kbd "<down>") 'zlc-select-next-vertical)
    (define-key map (kbd "C-u") 'backward-kill-path-element)))

;; anything
(defvar tarao/anything-basic-sources
  '(anything-c-source-buffers+
    anything-c-source-ffap-line
    anything-c-source-ffap-guesser))
(defvar tarao/anything-other-sources
  '(anything-c-source-recentf
    anything-c-source-bookmarks
    anything-c-source-locate))
(bundle anything
  (defvar anything-c-locate-command
    (cond ((eq system-type 'gnu/linux) "locate -i -r %s")
          ((eq system-type 'berkeley-unix) "locate -i %s")
          ((eq system-type 'windows-nt) "es -i -r %s")
          (t "locate %s")))
  (setq-default anything-enable-shortcuts 'alphabet
                anything-for-files-prefered-list
                `(,@tarao/anything-basic-sources
                  anything-c-source-files-in-current-dir+
                  ,@tarao/anything-other-sources)
                anything-complete-sort-candidates t)
  (global-set-key (kbd "C-x b") #'anything-for-files)
  (with-eval-after-load-feature 'anything
    (define-key anything-map (kbd "M-n") #'anything-next-source)
    (define-key anything-map (kbd "M-p") #'anything-previous-source))
  (with-eval-after-load-feature 'anything-config
    (dolist (src tarao/anything-other-sources)
      (add-to-list src '(delayed))))
  (global-set-key [remap execute-extended-command]
                  #'anything-execute-extended-command)
  ;; patch
  (defadvice alcs-make-candidates (around alcs-save-excursion activate)
    "`alcs-make-candidates' uses `set-buffer' and doesn't restore
the current buffer."
    (save-excursion ad-do-it))
  (defadvice anything-c-locate-init
    (after no-anything-update-move-first-line activate)
    "Prevent `anything-c-locate-init' from calling
`anything-update-move-first-line', which accidentally resets the
selection of candidates on finishing an asynchronous locate
process."
    (set-process-sentinel (get-process "locate-process") nil)))
(bundle descbinds-anything)
(bundle anything-git-files
  (defun tarao/anything-for-files ()
    (interactive)
    (require 'anything-config)
    (require 'anything-git-files)
    (let* ((git-source (if (anything-git-files:git-p)
                           `(anything-git-files:modified-source
                             anything-git-files:untracked-source
                             anything-git-files:all-source
                             ,@(anything-git-files:submodule-sources 'all))
                         '(anything-c-source-files-in-current-dir+)))
           (sources `(,@tarao/anything-basic-sources
                      ,@git-source
                      ,@tarao/anything-other-sources)))
      (anything-other-buffer sources "*anything for files*"))))
(unless (fboundp 'tarao/anything-for-files)
  (fset 'tarao/anything-for-files 'anything-for-files))

;; auto completion like IntelliSense
(bundle! auto-complete
  (global-auto-complete-mode t)
  (setq ac-auto-show-menu 0.5)
  (define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
  (define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
  (define-key ac-complete-mode-map (kbd "TAB") nil))
