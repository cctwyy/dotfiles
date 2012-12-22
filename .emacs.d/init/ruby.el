(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(autoload 'rdoc-mode "rdoc-mode"
  "Mode for editing rdoc files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
                ("Rakefile$" . ruby-mode)
                ("\\.rdoc$" . rdoc-mode)) auto-mode-alist)
      interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)))
