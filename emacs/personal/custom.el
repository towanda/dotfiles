(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; personal config
(setq user-mail-address "manueltxo@gmail.com")
(setq user-full-name "Manu Campos")

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
'(buffer-encoding (quote utf-8))
'(recentf-mode t)
'(transient-mark-mode t)
(set-keyboard-coding-system nil)
(setq make-backup-files nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(column-number-mode 1)
(setq linum-format "%4d  ")
(disable-theme 'zenburn)
(load-theme 'brin)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;; Key modifiers for Mac OS X Emacs.app in spanish MBP keyboard
(global-set-key (kbd "M-1") "|")
(global-set-key (kbd "M-2") "@")
(global-set-key (kbd "M-3") "#")
(global-set-key (kbd "M-º") "\\")
(global-set-key (kbd "M-ç") "}")
(global-set-key (kbd "M-+") "]")

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key "\M-t" 'toggle-comment-on-line)
(global-set-key "\C-c\C-l" 'goto-line)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-u" 'uncomment-region)


(require 'bundler)

(toggle-frame-fullscreen)

(setq prelude-guru nil)
(setq ns-use-srgb-colorspace t)

(add-to-list 'load-path "~/emacs.d/vendor")
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

(defun open-jira-ticket ()
  "Open a Jira ticket in browser"
  (interactive)
  (let((ticket-number (read-from-minibuffer "Jira ticket: ")))
    (browse-url (concat "https://wuakitv.atlassian.net/browse/" ticket-number))))

(defun open-wuaki-common ()
  "Open WuakiCommon Gemfile"
  (interactive)
  (find-file "~/wuaki_common/Gemfile"))



;; jabber stuf
(require 'jabber)
(setq jabber-chat-buffer-show-avatar nil)
(setq jabber-account-list ';
      (
       ("manueltxo@gmail.com"
        (:network-server . "talk.google.com")
        (:port . 443)
        (:connection-type . ssl))
       ("manu@wuaki.tv"
        (:network-server . "talk.google.com")
        (:port . 443)
        (:connection-type . ssl))
       ;; ("20667_179865@chat.hipchat.com"
       ;; 	(:network-server . "conf.hipchat.com")
       ;; 	(:port . 443)
       ;; 	(:connection-type . ssl))
       ))

;; simpler format for prompts
(setq jabber-chat-buffer-show-avatar nil
      jabber-chat-foreign-prompt-format "> "
      jabber-chat-local-prompt-format "> "
      jabber-chat-system-prompt-format "*** "
      jabber-chat-time-format "%H:%M"
      jabber-default-show ""
      jabber-groupchat-prompt-format "%n> "
      jabber-muc-private-foreign-prompt-format "%g/%n> ")

;; improve the default settings
(setq jabber-roster-line-format "%c %-25n %u %-8s"
      jabber-roster-show-title nil
      jabber-show-resources nil
      jabber-show-offline-contacts nil
      jabber-avatar-cache-directory "/tmp/jabber-avatars"
      jabber-events-request-these (quote (delivered displayed composing)))

;; don't show any presence notifications
(setq jabber-alert-presence-hooks '())

;; history
(setq jabber-history-enabled t
      jabber-use-global-history nil
      jabber-backlog-number 40
      jabber-backlog-days 30
      jabber-history-dir "~/.cache/jabber-history")

(add-hook 'ruby-mode-hook 'robe-mode)
