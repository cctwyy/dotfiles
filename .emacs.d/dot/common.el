(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(tool-bar-mode nil)
 '(menu-bar-mode nil))

; load-path
(setq load-path (cons "~/.emacs.d/site-lisp" load-path))
(setq load-path (cons "~/.emacs.d" load-path))

; hostname
(string-match "^\\([^\\.]+\\)\\(\\.\\(.*\\)\\)?$" (system-name))
(defconst short-hostname (replace-match "\\1" t nil (system-name))
  "Host part of function `system-name'.")

; no cursor blinking
(blink-cursor-mode nil)

; key bindings
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-j") 'enlarge-window)
(global-set-key (kbd "M-k") 'shrink-window)

; terminal fix
(global-set-key (kbd "M-O a") 'backward-paragraph)
(global-set-key (kbd "M-O b") 'forward-paragraph)
(global-set-key (kbd "M-O d") 'backward-word)
(global-set-key (kbd "M-O c") 'forward-word)
(global-set-key (kbd "<A-next>") 'scroll-other-window)
(global-set-key (kbd "<A-prior>") 'scroll-other-window-down)
(global-set-key (kbd "ESC <down>") 'enlarge-window)
(global-set-key (kbd "ESC <up>") 'shrink-window)
(global-set-key (kbd "<A-down>") 'enlarge-window)
(global-set-key (kbd "<A-up>") 'shrink-window)
(global-set-key (kbd "M-o 3 b") 'enlarge-window)
(global-set-key (kbd "M-o 3 a") 'shrink-window)
(global-set-key (kbd "M-O 3 b") 'enlarge-window)
(global-set-key (kbd "M-O 3 a") 'shrink-window)
(global-set-key (kbd "ESC M-O d") 'backward-sexp)
(global-set-key (kbd "ESC M-O c") 'forward-sexp)

; Mule-UCS settings
;-; --> disabled: not needed in Emacs 22
;-;(require 'un-define) ; Unicode
;-;(require 'jisx0213)  ; JIS X 0213

(when (>= emacs-major-version 23)
  (defun set-east-asian-ambiguous-width (width)
    (dolist (range
             '(#x00A1 #x00A4 (#x00A7 . #x00A8) #x00AA (#x00AD . #x00AE)
                      (#x00B0 . #x00B4) (#x00B6 . #x00BA) (#x00BC . #x00BF)
                      #x00C6 #x00D0 (#x00D7 . #x00D8) (#x00DE . #x00E1)
                      #x00E6 (#x00E8 . #x00EA) (#x00EC . #x00ED) #x00F0
                      (#x00F2 . #x00F3) (#x00F7 . #x00FA) #x00FC #x00FE
                      #x0101 #x0111 #x0113 #x011B (#x0126 . #x0127) #x012B
                      (#x0131 . #x0133) #x0138 (#x013F . #x0142) #x0144
                      (#x0148 . #x014B) #x014D (#x0152 . #x0153)
                      (#x0166 . #x0167) #x016B #x01CE #x01D0 #x01D2 #x01D4
                      #x01D6 #x01D8 #x01DA #x01DC #x0251 #x0261 #x02C4
                      #x02C7 (#x02C9 . #x02CB) #x02CD #x02D0
                      (#x02D8 . #x02DB) #x02DD #x02DF (#x0300 . #x036F)
                      (#x0391 . #x03A9) (#x03B1 . #x03C1) (#x03C3 . #x03C9)
                      #x0401 (#x0410 . #x044F) #x0451 #x2010
                      (#x2013 . #x2016) (#x2018 . #x2019) (#x201C . #x201D)
                      (#x2020 . #x2022) (#x2024 . #x2027) #x2030
                      (#x2032 . #x2033) #x2035 #x203B #x203E #x2074 #x207F
                      (#x2081 . #x2084) #x20AC #x2103 #x2105 #x2109 #x2113
                      #x2116 (#x2121 . #x2122) #x2126 #x212B
                      (#x2153 . #x2154) (#x215B . #x215E) (#x2160 . #x216B)
                      (#x2170 . #x2179) (#x2190 . #x2199) (#x21B8 . #x21B9)
                      #x21D2 #x21D4 #x21E7 #x2200 (#x2202 . #x2203)
                      (#x2207 . #x2208) #x220B #x220F #x2211 #x2215 #x221A
                      (#x221D . #x2220) #x2223 #x2225 (#x2227 . #x222C)
                      #x222E (#x2234 . #x2237) (#x223C . #x223D) #x2248
                      #x224C #x2252 (#x2260 . #x2261) (#x2264 . #x2267)
                      (#x226A . #x226B) (#x226E . #x226F) (#x2282 . #x2283)
                      (#x2286 . #x2287) #x2295 #x2299 #x22A5 #x22BF #x2312
                      (#x2460 . #x24E9) (#x24EB . #x254B) (#x2550 . #x2573)
                      (#x2580 . #x258F) (#x2592 . #x2595) (#x25A0 . #x25A1)
                      (#x25A3 . #x25A9) (#x25B2 . #x25B3) (#x25B6 . #x25B7)
                      (#x25BC . #x25BD) (#x25C0 . #x25C1) (#x25C6 . #x25C8)
                      #x25CB (#x25CE . #x25D1) (#x25E2 . #x25E5) #x25EF
                      (#x2605 . #x2606) #x2609 (#x260E . #x260F)
                      (#x2614 . #x2615) #x261C #x261E #x2640 #x2642
                      (#x2660 . #x2661) (#x2663 . #x2665) (#x2667 . #x266A)
                      (#x266C . #x266D) #x266F #x273D (#x2776 . #x277F)
                      (#xE000 . #xF8FF) (#xFE00 . #xFE0F) #xFFFD ))
        (set-char-table-range char-width-table range width)))
  (set-east-asian-ambiguous-width 2))
(when (and (< emacs-major-version 23) (>= emacs-major-version 22))
  ; language and charset
  ; jisx0213 support in utf-8
  (utf-translate-cjk-set-unicode-range
   '((#x00a2 . #x00a3) (#x00a7 . #x00a8) (#x00ac . #x00ac) (#x00b0 . #x00b1)
     (#x00b4 . #x00b4) (#x00b6 . #x00b6) (#x00d7 . #x00d7) (#X00f7 . #x00f7)
     (#x0370 . #x03ff) (#x0400 . #x04FF) (#x2000 . #x206F) (#x2100 . #x214F)
     (#x2190 . #x21FF) (#x2200 . #x22FF) (#x2300 . #x23FF) (#x2500 . #x257F)
     (#x25A0 . #x25FF) (#x2600 . #x26FF) (#x2e80 . #xd7a3) (#xff00 . #xffef)))
     ; for patched utf-8.el (utf-8.el.diff applied; subst-jisx0213.el required)
     ;-; --> disabled: there are problems in showing latin characters
     ;-;(modify-category-entry (make-char 'japanese-jisx0213-1) ?j)
     ;-;(modify-category-entry (make-char 'japanese-jisx0213-2) ?j)
     ;-;(eval-after-load "subst-jis" '(load "subst-jisx0213"))
     ;-;(load "utf-8") ;; patched file
     ;-;(load "utf-16") ;; for safe-charsets
     ;-;(utf-translate-cjk-set-unicode-range `((#x80 . ,(lsh -1 -1))))
)
; language and coding-system
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(if (equal (getenv "TERM")  "cygwin")
    (set-terminal-coding-system 'sjis)
  (set-terminal-coding-system 'utf-8-unix))
(require 'default-file-coding-systems)

; move window
(windmove-default-keybindings)
(setq windmove-wrap-around t)

; skk
(setq skk-init-file "dot/.skk")
(require 'skk-autoloads)
(global-set-key (kbd "C-x C-j") 'skk-mode)

; show line numbers
(require 'linum)
(require 'linum+)
(global-set-key (kbd "M-N") 'linum-mode)
(global-set-key (kbd "M-n") 'relative-linum-mode)

; eof mark
(require 'end-mark)
(unless window-system (global-end-mark-mode))

; parenthesis
(show-paren-mode t)

; browse-kill-ring
(autoload 'browse-kill-ring "browse-kill-ring" nil t)
(define-key global-map (kbd "M-y") 'browse-kill-ring)
(load "browse-kill-ring+")

; make *scratch* immortal
(require 'immortal-buffer)
(make-buffer-immortal "*scratch*")

; shell command (with saving the last command for default value)
(require 'shell-command+)
(global-set-key (kbd "M-!") 'shell-command+)
(global-set-key (kbd "M-|") 'shell-command-on-region+)

; completer
(require 'completer)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq completer-words "---. <_")

; anything
(require 'anything-config)
(setq anything-sources
      '(
        anything-c-source-ffap-line
        anything-c-source-ffap-guesser
        anything-c-source-buffers+
        anything-c-source-file-name-history
        anything-c-source-files-in-current-dir+
        anything-c-source-locate
        anything-c-source-kill-ring
        ))
(global-set-key (kbd "C-x b") 'anything)
(define-key anything-map (kbd "C-M-n") 'anything-next-source)
(define-key anything-map (kbd "C-M-p") 'anything-previous-source)

;; describe-bindings alternatative
(require 'descbinds-anything)
(descbinds-anything-install)

; auto completion like IntelliSense
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "TAB") nil)

; auto-insert
(require 'autoinsert)
(add-hook 'find-file-not-found-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/insert/")
(setq auto-insert-query nil)
(setq auto-insert-alist nil)

; M-x compile
(setq compile-command "make -k")
(setq compile-history (list "make" "make clean"))

; M-x grep
(setq grep-program "lgrep")
(setq grep-command "lgrep -inH -Au8 ")

; wc (CC/WW/LL)
(autoload 'word-count-mode "word-count" "Minor mode to count words." t nil)
(global-set-key (kbd "M-+") 'word-count-mode)

; tabbing
(setq-default tab-width 4 indent-tabs-mode nil)

; show trailing whitespace
(setq-default show-trailing-whitespace t)

; show fullwidth-spaces and tabs
(require 'jaspace)
;(setq jaspace-alternate-eol-string "\xab\n")
(setq jaspace-highlight-tabs t)
(setq jaspace-highlight-tabs ?>)

; align
(require 'align)

; ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
                ("Rakefile$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)))
(autoload 'rdoc-mode "rdoc-mode"
  "Mode for editing rdoc files" t)
(setq auto-mode-alist
      (append '(("\\.rdoc$" . rdoc-mode)) auto-mode-alist))

; tuareg-mode - Objective Caml support
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-run-caml "tuareg" "Run the Caml interactive compiler" t)
; font-lock
(if (and (boundp 'window-system) window-system)
    (when (string-match "XEmacs" emacs-version)
      (if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
          (require 'sym-lock))
      (require 'font-lock)))

; haskell-mode
(load "haskell-site-file")

; css mode
(autoload 'css-mode "css-mode" "Major mode for editing CSS" t)
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq cssm-newline-before-closing-bracket t)

; nxml-mode
(load "rng-auto")
(add-to-list 'auto-mode-alist
             (cons (concat "\\."
                           (regexp-opt
                            '("xml" "xsd" "sch" "rng" "xslt"
                              "svg" "rss" "mxml") t)
                           "\\'")
                   'nxml-mode))
(unify-8859-on-decoding-mode)
(setq magic-mode-alist
      (cons '("<\\?xml " . nxml-mode)
            magic-mode-alist))
(fset 'xml-mode 'nxml-mode)
(fset 'html-mode 'nxml-mode)
;; use nxml-mode instead of sgml, xml or html mode.
(mapc
 (lambda (pair)
   (if (or (eq (cdr pair) 'xml-mode)
           (eq (cdr pair) 'sgml-mode)
           (eq (cdr pair) 'html-mode))
       (setcdr pair 'nxml-mode)))
 magic-mode-alist)
;; use zen-coding
(require 'zencoding-mode)
(require 'zencoding-trie)
(add-hook 'nxml-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap (kbd "C-j") 'zencoding-expand-line)
(define-key zencoding-preview-keymap (kbd "RET") 'zencoding-preview-accept)

; xquery mode
(autoload 'xquery-mode "xquery-mode" "Major mode for editing xquery" t)
(setq auto-mode-alist (cons '("\\.xquery$" . xquery-mode) auto-mode-alist))

(autoload 'yaml-mode "yaml-mode"
  "Mode for editing YAML files" t)
(setq auto-mode-alist
      (append '(("\\.yml$" . yaml-mode)
                ("\\.yaml$" . yaml-mode)) auto-mode-alist))

; LaTeX mode
(setq TeX-default-mode 'japanese-latex-mode)
(setq auto-mode-alist
  (append
   '(("\\.sty$" . LaTeX-mode)
     ("\\.tex$" . LaTeX-mode))
   auto-mode-alist))
(setq japanese-TeX-command-default "pTeX")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq latex-run-command "platex")
(setq default-file-coding-system-alist
      (append
       '(("\\.tex$" . euc-jp-unix)
         ("\\.sty$" . euc-jp-unix)
         ("\\.bib$" . euc-jp-unix))
       default-file-coding-system-alist))
(add-hook 'TeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; luxaky
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (equal short-hostname "luxaky")
    (progn
      ; color theme
      (load "color-theme-autoloads")
      ; shell
      (setq explicit-shell-file-name "zsh")
      (setq shell-file-name "zsh")
      (setq shell-command-switch "-c")
      ; mew
      (autoload 'mew "mew" nil t)
      (autoload 'mew-send "mew" nil t)
      (setq mew-smtp-user (user-login-name))
      (setq mew-mail-domain "orezdnu.org")
      (setq mew-mailbox-type 'mbox)
      (setq mew-mbox-command "incm")
      (setq mew-mbox-command-arg
            (concat "-u -d /home/users/" (user-login-name) "/Maildir"))
      ; emacs-w3m - a text browser
      (setq w3m-init-file "dot/.emacs-w3m")
      (load "w3m")
      (add-hook 'w3m-mode-hook
                '(lambda () (setq show-trailing-whitespace nil)))
      ; lookup - search dictionary
      (autoload 'lookup "lookup" nil t)
      (autoload 'lookup-region "lookup" nil t)
      (autoload 'lookup-pattern "lookup" nil t)
      (global-set-key (kbd "C-x C-y") 'lookup)
      (global-set-key (kbd "C-x y") 'lookup-region)
      (global-set-key (kbd "C-x l") 'lookup-pattern)))
