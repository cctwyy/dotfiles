(bundle csharp-mode
  (setq auto-mode-alist (cons '("\\.cs$" . csharp-mode) auto-mode-alist)))

;; use normal brace
(defadvice csharp-insert-open-brace
  (around ad-suppress-csharp-insert-open-brace activate)
  (call-interactively 'c-electric-brace))
