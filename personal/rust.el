(add-to-list 'load-path (expand-file-name "rust/emacs-racer" prelude-dir))
(add-to-list 'load-path (expand-file-name "rust/company-racer" prelude-dir))
(add-to-list 'load-path (expand-file-name "rust/flycheck-rust" prelude-dir))
(add-to-list 'load-path (expand-file-name "rust/rust-mode" prelude-dir))

(require 'rust-mode)
(require 'racer)
(require 'company-racer)
(require 'flycheck-rust)

(setq racer-cmd "/Users/brian/.cargo/bin/racer")
(setq racer-rust-src-path "/Users/brian/projects/rustc-1.10.0/src")

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook

          '(lambda ()
             ;; Enable racer
             (racer-activate)

             ;; Hook in racer with eldoc to provide documentation
             (racer-turn-on-eldoc)

             ;; Use flycheck-rust in rust-mode
             (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

             ;; Use company-racer in rust mode
             (set (make-local-variable 'company-backends) '(company-racer))

             ;; Key binding to jump to method definition
             (local-set-key (kbd "M-.") #'racer-find-definition)

             ;; Key binding to auto complete and indent
             (local-set-key (kbd "TAB") #'racer-complete-or-indent)))
