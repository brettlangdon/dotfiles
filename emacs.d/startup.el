;; Startup optimizations

;; Set garbage collection threshold
;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
(setq gc-cons-threshold-original gc-cons-threshold
      gc-cons-percentage-original gc-cons-percentage)
(setq gc-cons-threshold (* 1024 1024 100)
      gc-cons-percentage 0.6)

;; Set file-name-handler-alist
;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Set deferred timer to reset them
;; https://emacs.stackexchange.com/a/34367
(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold gc-cons-threshold-original)
   (setq gc-cons-percentage gc-cons-percentage-original)
   (setq file-name-handler-alist file-name-handler-alist-original)
   (makunbound 'gc-cons-threshold-original)
   (makunbound 'gc-cons-percentage-original)
   (makunbound 'file-name-handler-alist-original)
   (message "gc-cons-threshold and file-name-handler-alist restored")))

