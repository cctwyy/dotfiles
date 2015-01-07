;; emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path user-emacs-directory)

;; bundle (an El-Get wrapper)
(setq-default el-get-dir (locate-user-emacs-file "el-get")
              el-get-emacswiki-base-url
              "http://raw.github.com/emacsmirror/emacswiki.org/master/")
(add-to-list 'load-path (locate-user-emacs-file "el-get/bundle"))
(unless (require 'bundle nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "http://raw.github.com/tarao/bundle-el/master/bundle-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "recipes"))

(bundle with-eval-after-load-feature)

;; load init files
(bundle! emacs-jp/init-loader
  ;; load
  (setq-default init-loader-show-log-after-init nil
                init-loader-byte-compile t)
  (init-loader-load (locate-user-emacs-file "dot"))

  ;; hide compilation results
  (let ((win (get-buffer-window "*Compile-Log*")))
    (when win (delete-window win))))

;; put site-lisp and its subdirectories into load-path
(when (fboundp 'normal-top-level-add-subdirs-to-load-path)
  (let* ((dir (locate-user-emacs-file "site-lisp"))
         (default-directory dir))
    (when (file-directory-p dir)
      (add-to-list 'load-path dir)
      (normal-top-level-add-subdirs-to-load-path))))
