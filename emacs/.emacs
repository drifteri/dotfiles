(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (e2ansi clang-format cmake-mode lua-mode afternoon-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'afternoon t)
(setq-default c-basic-offset 4)

(defun ins-c++-curly ()
  "Insert {}.
Threat is as function body when from endline before )"
  (interactive)
  (if (looking-back "\\()\\|try\\|else\\|const\\|:\\)$")
      (progn
        (insert " {\n\n}")
        (indent-according-to-mode)
        (forward-line -1)
        (indent-according-to-mode))
    (insert "{}")
    (backward-char)))

(add-hook 'c-mode-common-hook 'my-c-common-hook)

(defun my-c-common-hook ()
  (define-key c-mode-base-map "{" 'ins-c++-curly))

(setq default-tab-width 4)

(global-linum-mode t)
(setq linum-format "%d ")
(setq linum-format "%4d \u2502 ")

    (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


(menu-bar-mode -1)

(add-hook 'c-mode-common-hook
          (function (lambda ()
                    (add-hook 'before-save-hook
                              'clang-format-buffer))))
