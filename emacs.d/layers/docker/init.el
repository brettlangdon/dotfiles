;; Dockerfile mode
;; https://github.com/spotify/dockerfile-mode
(use-package dockerfile-mode
  :defer t
  :mode ("Dockerfile\\'" . dockerfile-mode)
  :diminish dockerfile-mode)

;; docker-compose mode
;; https://github.com/meqif/docker-compose-mode
(use-package docker-compose-mode
  :defer t
  ;; DEV: https://github.com/meqif/docker-compose-mode/blob/c9f131d2c90d652435d407fd36c40feebfed1dad/docker-compose-mode.el#L164-L165
  :mode ("docker-compose[^/]*\\.yml\\'" . docker-compose-mode)
  :diminish docker-compose-mode)
