;; Better completion when using M-x
(smex-initialize)

;; Evil-leader mappings
(global-evil-leader-mode)
(evil-leader/set-key
  "p" 'helm-projectile-find-file
  "e" 'fiplr-find-file
  "b" 'helm-buffers-list
  "s" 'helm-find-files
  "k" 'kill-buffer)

;; Don't create backup files
(setq make-backup-files nil)

;; Enables and configures line numbering
(global-linum-mode 1)
(setq linum-format "%d ")

;; Autocomplete for Cider
(prelude-require-packages '(emmet-mode emmet-mode 2048-game ac-cider auto-complete popup cider queue pkg-info epl dash clojure-mode ac-html auto-complete popup ace-jump-buffer dash ace-jump-mode ace-window ace-jump-mode ag s dash anzu auto-complete popup browse-kill-ring cider queue pkg-info epl dash clojure-mode clojure-mode company diff-hl diminish discover-my-major makey easy-kill elisp-slime-nav evil-leader evil goto-chg undo-tree evil-numbers evil-paredit paredit evil goto-chg undo-tree evil-surround evil-tabs elscreen evil goto-chg undo-tree evil-visualstar evil goto-chg undo-tree exec-path-from-shell expand-region fiplr grizzl flx-ido flx flycheck-pos-tip popup flycheck let-alist pkg-info epl dash geiser gist gh logito pcache git-timemachine gitconfig-mode gitignore-mode god-mode goto-chg grizzl guide-key-tip pos-tip guide-key s popwin dash guru-mode helm-ag helm async helm-descbinds helm async helm-projectile projectile pkg-info epl dash f dash s s helm async ido-ubiquitous js2-mode json-mode json-snatcher json-reformat json-reformat json-snatcher let-alist logito magit git-rebase-mode git-commit-mode makey monokai-theme move-text operate-on-number ov paredit pcache popup popwin pos-tip projectile pkg-info epl dash f dash s s queue rainbow-delimiters rainbow-identifiers rainbow-mode s smartparens dash smartrep smex solarized-theme dash undo-tree vkill volatile-highlights web-mode xpm zenburn-theme))
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))

;; Flycheck support for Clojure
; (eval-after-load 'flycheck '(flycheck-clojure-setup))
; (global-flycheck-mode)
; (eval-after-load 'flycheck
;   '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;; Web mode configuration
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))

(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Change cursor appearance depending on the mode
;; (setq evil-emacs-state-cursor '("red" box))
;; (setq evil-normal-state-cursor '("green" box))
;; (setq evil-visual-state-cursor '("orange" box))
;; (setq evil-insert-state-cursor '("red" bar))
;; (setq evil-replace-state-cursor '("red" bar))

;; Change cursor color depending on mode

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("lawn green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("deep sky blue" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; Set font
(set-face-attribute 'default nil
                    :family "Monaco" :height 100 :weight 'normal)

;; Disable scroll bars
(scroll-bar-mode -1)

(provide 'init)
;;; init.el ends here
