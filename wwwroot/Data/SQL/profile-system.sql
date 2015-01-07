-- -----------------------------
-- 系统配置
-- -----------------------------


-- -----------------------------
-- 设置默认管理员信息
-- 加密Key 'UC_AUTH_KEY' => '^U8ey|+w`R{0!Fr3Z(7&N>4ELG.;}@2jt#AS)*xa'); 
-- 账号密码都为 root
-- -----------------------------
DELETE FROM `onethink_user` WHERE id = 1;
INSERT INTO `onethink_user` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES (1, 'root', '149bb7ed74d9bf6f2781ed39fc520893', 'mrji1990@gmail.com', '', 1417342882, 2130706433, 1420470762, 2130706433, 1417342882, 1);