;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
 (require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/elpa/nord-theme-20180913.1749"))
(load-theme 'nord t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" default)))
 '(elfeed-feeds
   (quote
    ("dilbert.com/feed" "http://xkcd.com/rss.xml" "feeds.feedburner.com/stevelosh" "planet.lisp.org/rss20.xml" "http://blog.quicklisp.org/feeds/posts/default")))
 '(erc-email-userid "nwwc")
 '(package-selected-packages
   (quote
    (nodejs-repl company-tern elfeed-goodies elfeed indium company tern wacspace pdf-tools rotate google-this xref-js2 js2-refactor js2-mode project-explorer projectile dimmer linum-relative rainbow-mode rainbow-delimiters treemacs magit define-word use-package slime neotree doom-modeline nord-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(require 'js2-refactor)
(require 'xref-js2)
 (require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
(require 'doom-modeline)
(doom-modeline-mode 1)
(require 'all-the-icons)
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
(use-package erc
  :ensure nil
  :defer t
  :config
  (add-hook 'erc-mode-hook
            (lambda ()
              (setq-local scroll-margin 1)))
  (setq erc-rename-buffers t
erc-log-channels-directory "~/.ercLogs/logs/"
        erc-interpret-mirc-color t
        erc-lurker-hide-list '("JOIN" "PART" "QUIT")
        erc-autojoin-channels-alist '(("freenode.net" "#emacs"))))
(erc-log-mode)
(setq erc-generate-log-file-name-function (quote erc-generate-log-file-name-with-date))
(setq erc-save-buffer-on-part nil)
(setq erc-save-queries-on-quit nil)
(setq erc-log-write-after-insert t)
(setq erc-log-write-after-send t)
