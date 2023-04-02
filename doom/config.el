;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Manoel"
      user-mail-address "mancordosa@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documentos/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.




(after! org (setq! org-agenda-files '("$HOME/Documentos/org/agenda.org")))

(after! centaur-tabs
  (setq centaur-tabs-style "wave"))

(add-to-list 'window-setup-hook #'toggle-frame-fullscreen)

;; Keymaps
;; (map! :desc "Changing hjkl to jklç"
;;       (:after evil
;;               (:map evil-normal-state-map)
;;               (:map evil-visual-state-map)
;;               (:map magit-mode-map
;;                     "h" nil
;;                     "j" nil
;;                     "k" nil
;;                     "l" nil
;;                     "j" #'evil-backward-char
;;                     "k" #'evil-next-visual-line
;;                     "l" #'evil-previous-visual-line
;;                     "ç" #'evil-forward-char)
;;               (:map evil-motion-state-map
;;                     "h" nil
;;                     "j" nil
;;                     "k" nil
;;                     "l" nil
;;                     "j" #'evil-backward-char
;;                     "k" #'evil-next-line
;;                     "l" #'evil-previous-line
;;                     "ç" #'evil-forward-char)
;;               (:map evil-window-map
;;                     "j" #'evil-window-left
;;                     "k" #'evil-window-bottom
;;                     "l" #'evil-window-up
;;                     "ç" #'evil-window-right)))


;; HACK evil-collection-pdf-maps is broken so I have to use the evil configs directly
;; HACK only works after a config reload
;; (evil-define-key 'normal pdf-view-mode-map (kbd "k") 'pdf-view-next-page-command)
;; (evil-define-key 'normal pdf-view-mode-map (kbd "l") 'pdf-view-previous-page-command)
;; (evil-define-key 'normal pdf-view-mode-map (kbd "j") nil)

;; (evil-define-key 'visual magit-mode-map (kbd "k") nil)
;; (evil-define-key 'normal magit-mode-map (kbd "k") nil)
;; (evil-define-key 'visual magit-mode-map (kbd "l") nil)
;; (evil-define-key 'normal magit-mode-map (kbd "l") nil)
;; (evil-define-key 'visual magit-mode-map (kbd "h") nil)
;; (evil-define-key 'normal magit-mode-map (kbd "h") nil)
;; (evil-define-key 'visual magit-mode-map (kbd "k") 'evil-next-visual-line)
;; (evil-define-key 'normal magit-mode-map (kbd "k") 'evil-next-visual-line)
;; (evil-define-key 'visual magit-mode-map (kbd "l") 'evil-previous-visual-line)
;; (evil-define-key 'normal magit-mode-map (kbd "l") 'evil-previous-visual-line)

(add-hook 'elfeed-search-mode-hook #'elfeed-update)

;; `evil-collection-pdf-view' isn't defined in doom, which causes error with `map!'
;; (map! :after evil
;;       :map evil-collection-pdf-maps
;;       "k" #'evil-collection-pdf-view-next-line-or-next-page
;;       "l" #'evil-collection-pdf-view-previous-line-or-previous-page)


;; I can generate a list with the `list' function
;;
;;`Space/Meta'`h'`k' calls `helpful.el', which is a buffer that tells me what function
;; a key combination calls when pressed
