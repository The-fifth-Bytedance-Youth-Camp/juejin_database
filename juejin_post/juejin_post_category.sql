create table category
(
	id           int auto_increment
		primary key,
	name         varchar(50)          not null,
	gmt_modified datetime             null on update CURRENT_TIMESTAMP,
	gmt_created  datetime             null,
	is_delete    tinyint(1) default 0 not null,
	constraint category_name_uindex
		unique (name)
)
	collate = utf8_unicode_ci;

INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (1, '后端', '2023-01-25 17:05:01', '2023-01-25 17:04:47', 0);
INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (2, '前端', '2023-01-25 17:05:02', '2023-01-25 17:04:49', 0);
INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (3, 'Android', '2023-01-25 17:05:04', '2023-01-25 17:04:51', 0);
INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (4, 'iOS', '2023-01-25 17:05:05', '2023-01-25 17:04:53', 0);
INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (5, '人工智能', '2023-01-25 17:05:07', '2023-01-25 17:04:54', 0);
INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (6, '开发工具', '2023-01-25 17:05:09', '2023-01-25 17:04:56', 0);
INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (7, '代码人生', '2023-01-25 17:05:11', '2023-01-25 17:04:57', 0);
INSERT INTO juejin_post.category (id, name, gmt_modified, gmt_created, is_delete) VALUES (8, '阅读', '2023-01-25 17:05:12', '2023-01-25 17:04:59', 0);