;; Removing toolbar
(server-start)
;; Remember last session
(desktop-save-mode 1)
;; Always set word wrap
(global-visual-line-mode t)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(show-paren-mode 1)

;; list the packages you want
(progn
  (setq package-list '(flx-ido tern js2-mode sr-speedbar tabbar fiplr magit multiple-cursors helm tern multiple-cursors
			       yasnippet auto-complete helm-gtags markdown-mode web-mode move-text web-beautify jedi python-mode transpose-frame vlf auto-compile
			       ;; Taken from https://github.com/tuhdo/emacs-c-ide-demo/blob/master/init.el
			       anzu duplicate-thing ggtags helm-gtags helm-projectile helm-swoop tabbar
			       clean-aindent-mode comment-dwim-2 dtrt-indent ws-butler iedit yasnippet smartparens projectile volatile-highlights undo-tree zygospore
			       ;; END
			       ac-js2 tern-auto-complete yaml-mode racket-mode quack geiser let-alist haskell-mode shm hindent))
  ;; Now putting some autoInstall stuff
  (setq package-archives '(
			   ("meLpa-stable" . "http://stable.melpa.org/packages/")
			   ("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("melpa" . "http://melpa.milkbox.net/packages/")
			   ))


  ;;activate all the packages (in particular autoloads)
  (package-initialize)
  ;; fetch the list of packages available 
  (unless package-archive-contents
    (package-refresh-contents))


  ;; install the missing packages
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)
(setq exec-path (append exec-path '("/home/el/scala/bin")))
(load "~/.emacs.d/elpa/scribble.el")
;; **** Custom Vars- Theme and stuff ***********
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dictionary-files
   (quote
    ("~/.emacs.d/elpa/auto-complete-20150618.1949/dict")))
 '(ac-use-fuzzy t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("0a072360db47f066a246d7254d126a347abb80707ab3f181fe97b4729bb318e9" default)))
 '(ecb-options-version "2.40")
 '(frame-brackground-mode (quote dark))
 '(global-semantic-idle-scheduler-mode nil)
 '(org-agenda-files (quote ("~/e/crest" "~/Dropbox/org" "~/e/apps" "~/e/code")))
 '(org-support-shift-select t)
 '(semantic-imenu-auto-rebuild-directory-indexes t)
 '(semantic-imenu-bucketize-file t)
 '(semantic-imenu-bucketize-type-members nil)
 '(semantic-imenu-buckets-to-submenu nil)
 '(semantic-imenu-expand-type-members nil)
 '(semantic-imenu-summary-function (quote semantic-format-tag-uml-prototype))
 '(shm-program-name "/home/el/.cabal/bin/structured-haskell-mode")
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-auto-refresh nil)
 '(standard-indent 2)
 '(web-mode-block-padding 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2))
(require 'vlf-setup)
;; ;********************** Flx IDO stuff ********************8
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
;(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq gc-cons-threshold 20000000)
;;********************* Transpose frame  *****************************************
(require 'transpose-frame)
(global-set-key (kbd "s-r") 'rotate-frame-clockwise)
(global-set-key (kbd "M-'") 'auto-complete)
;;********************* End transpose frame *****************************************
;; ;************************* Speedbar Related customization ******************
(require 'sr-speedbar)
(global-set-key (kbd "C-0") 'sr-speedbar-toggle)
(global-set-key (kbd "C-9") 'sr-speedbar-select-window)
;;****************************** Move lines up and down **********************

;;********************* Shortcuts *******************************************
(progn
  (require 'fiplr)
  (setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules"))
			      (files ("*.jpg" "*.png" "*.zip" "*~"))))
  (global-set-key (kbd "C-.") 'rgrep)
  (global-set-key (kbd "s-j") 'helm-semantic-or-imenu)
  (global-set-key (kbd "C-;") 'ido-kill-buffer)
  (global-set-key (kbd "C-p") 'fiplr-find-file)
  (global-set-key (kbd "C-,") 'compile)	
  (global-set-key (kbd "C-Q") 'goto-line)	
  (global-set-key (kbd "C-x m") 'man)
  (global-set-key (kbd "C-x r") 'rename-buffer)
  (global-set-key (kbd "M-s") 'magit-status)
  (global-set-key (kbd "M-o") 'other-window)
  (global-set-key (kbd "M-f") 'ido-find-file)  
  (global-set-key (kbd "M-<up>") 'move-text-up)
  (global-set-key (kbd "M-<down>") 'move-text-down)

  (global-set-key (kbd "M-b") 'ido-switch-buffer)
  (global-set-key (kbd "C-b") 'ido-switch-buffer-other-window)
  (require 'org)
  (global-set-key (kbd "C-t") 'org-iswitchb)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t))

;;********************* End shortcuts *******************************************
;;********************* Org Mode  ********************************************


;;********************* Tabbar config  *******************************************
;; (progn 
;; (dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
;;   (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
;; (defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
;;   `(defun ,name (arg)
;;      (interactive "P")
;;      ,do-always
;;      (if (equal nil arg)
;; 	 ,on-no-prefix
;;        ,on-prefix)))
;; (defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
;; (defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
;; (global-set-key [(control tab)] 'shk-tabbar-next)
;; (global-set-key [(control shift tab)] 'shk-tabbar-prev))
;;********************* End Tabbar config  *******************************************
;;********************* Multiple Cursors *****************************************
(progn
  (require 'multiple-cursors)

  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))
;******************** End Multiple Cursors ************************************

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ;****************************** AC and YASnippet ***************
(progn
  (require 'auto-complete)
					; do default config for auto-complete
  (require 'auto-complete-config)
  (ac-config-default)
  ;; start yasnippet with emacs

  (progn
    (require 'yasnippet)
    (yas-global-mode 1)))

;; ;************************* Web Mode ***********************************
(require 'web-mode)
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'ac-sources 'ac-source-html-tag)
(add-to-list 'ac-sources 'ac-source-html-attribute)
(add-to-list 'web-mode-ac-sources-alist
             '(("css" . (ac-source-css-property))
	       ("html" . (ac-source-html-tag
			  ac-source-words-in-buffer
			  ac-source-abbrev
			  ac-source-html-attribute))))
(add-to-list 'auto-mode-alist '("\\.html*\\'" . web-mode))
;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)
(setq standard-indent 2)
;; ;;*********** JS2 and tern *****************************
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(if (eq system-type 'windows-nt)
    (setq tern-command '("node" "C:\\Users\\El\\AppData\\Roaming\\npm\\node_modules\\tern\\bin\\tern")))
(setq js-indent-level 2)
(setq js2-basic-offset 2)
;; ***************************** Flycheck stuff for js *****************************
;; http://www.flycheck.org/manual/latest/index.html
(progn
  (require 'flycheck)

  ;; turn on flychecking globally
  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
		(append flycheck-disabled-checkers
			'(javascript-jshint)))

  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  ;; customize flycheck temp file prefix
  (setq-default flycheck-temp-prefix ".flycheck")

  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
		(append flycheck-disabled-checkers
			'(json-jsonlist)))
)

;; ***************************** Racket MOde stuff *****************************
(require 'racket-mode)
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))
(add-hook 'racket-mode-hook 'auto-complete-mode)
;; ;******************** Config ggtags for C++  ***********************************
;; C++ stuff from https://github.com/tuhdo/emacs-c-ide-demo/blob/master/init.el


;; (setq
;;  helm-gtags-ignore-case t
;;  helm-gtags-auto-update t
;;  helm-gtags-use-input-at-cursor t
;;  helm-gtags-pulse-at-cursor t
;;  helm-gtags-prefix-key "\C-cg"
;;  helm-gtags-suggested-key-mapping t
;;  )
(require 'helm-gtags)
;; ;; Enable helm-gtags-mode
;; (add-hook 'dired-mode-hook 'helm-gtags-mode)
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;; (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
(progn
  ;; (add-to-list 'load-path "~/.emacs.d/custom")
  ;; (require 'setup-helm)
  ;; (require 'setup-helm-gtags)
  ;; (require 'setup-ggtags)
  ;; (require 'setup-cedet)
  ;; (require 'setup-editing)

  ;; (windmove-default-keybindings)

  ;; function-args
  (progn
    (require 'function-args)
    (fa-config-default)
    (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
    (define-key c++-mode-map  [(control tab)] 'moo-complete)
    (define-key c++-mode-map (kbd "M-j") 'moo-jump-local)
    )

  ;; (define-key c-mode-map  [(tab)] 'company-complete)
  ;; (define-key c++-mode-map  [(tab)] 'company-complete)

  ;; ;; company
  ;; (require 'company)
  ;; ;; (add-hook 'after-init-hook 'global-company-mode)
  ;; ;; (delete 'company-semantic company-backends)
  ;; ;; (define-key c-mode-map  [(control tab)] 'company-complete)
  ;; ;; (define-key c++-mode-map  [(control tab)] 'company-complete)

  ;; ;; company-c-headers
  ;; (add-to-list 'company-backends 'company-c-headers)

  ;; ;; hs-minor-mode for folding source code
  ;; (add-hook 'c-mode-common-hook 'hs-minor-mode)

  ;; Available C style:
  ;; “gnu”: The default style for GNU projects
  ;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
  ;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
  ;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
  ;; “stroustrup”: What Stroustrup, the author of C++ used in his book
  ;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
  ;; “linux”: What the Linux developers use for kernel development
  ;; “python”: What Python developers use for extension modules
  ;; “java”: The default style for java-mode (see below)
  ;; “user”: When you want to define your own style
  ;; (setq
  ;;  c-default-style "linux" ;; set style to "linux"
  ;;  )

  ;; activate whitespace-mode to view all whitespace characters
  (global-set-key (kbd "C-c w") 'whitespace-mode)

  ;; show unncessary whitespace that can mess up your diff
  (add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

  ;; Compilation
  (global-set-key (kbd "<f5>") (lambda ()
                                 (interactive)
                                 (setq-local compilation-read-command nil)
                                 (call-interactively 'compile)))

  ;; setup GDB
  (setq
   ;; use gdb-many-windows by default
   gdb-many-windows t

   ;; Non-nil means display source file containing the main routine at startup
   gdb-show-main t
   )

  ;; Package: projejctile
  (require 'projectile)
  (projectile-global-mode)
  (setq projectile-enable-caching t)

  (require 'helm-projectile)
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien)
  (global-set-key (kbd "M-p s") 'helm-projectile-switch-project)
  (global-set-key (kbd "M-p b") 'helm-projectile-switch-to-buffer)
  ;; Package zygospore - For undoing delete other windows - This is awesome
  (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))
;; ;******************** End ggtags ************************************
;; ******************* Python suff ***********************************
;; Python mode settings
(require 'python-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
;; (add-hook 'python-mode-hook 'autopair-mode)(add-hook 'python-mode-hook 'auto-complete-mode)
;; ******************* End Python suff ***********************************
;; *********************************** Ruby ***********************************
(progn
  (defun ri-bind-key ()
    (local-set-key [C-j] 'yari-helm))

  (add-hook 'ruby-mode-hook 'ri-bind-key)
  )
;; *********************************** End Ruby stuff ***********************************
(put 'scroll-left 'disabled nil)
;; *********************************** Haskell stuff ***********************************
;; Standard libraries needed
(require 'cl-lib)
;; Load packages
(require 'shm)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(require 'hindent)
(require 'shm-case-split)
(require 'shm-reformat)
;; Mode initializations
;; (smex-initialize)
(load "haskell-mode-autoloads.el")
;; (turn-on-haskell-simple-indent)

;; *********************************** End Haskell stuff ***********************************
;; *********************************** OCaml stuff ***********************************
;; Add opam emacs directory to the load-path
(progn
  (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
  ;; Load merlin-mode
  ;; (autoload 'merlin-mode "merlin" "Merlin mode" t)
  (require 'merlin)
  ;; Start merlin on ocaml files
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)
  ;; Enable auto-complete
  (setq merlin-ac-setup 'easy)
  (setq merlin-use-auto-complete-mode 'easy)
  ; Make company aware of merlin
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'merlin-company-backend))
; Enable company on merlin managed buffers
  (add-hook 'merlin-mode-hook 'company-mode)
;; Or enable it globally:
;; (add-hook 'after-init-hook 'global-company-mode)

  ;; Use opam switch to lookup ocamlmerlin binary
  (setq merlin-command 'opam))
;;********************************** End OCaml stuff **********************************
;; ********************************** Java stuff **********************************
(load "~/.emacs.d/java-mode-autoloads.el")
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)


;; ********************************** Scala stuff **********************************
;; (use-package ensime
;;   :commands ensime ensime-mode)
;; (add-hook 'scala-mode-hook 'ensime-mode)
