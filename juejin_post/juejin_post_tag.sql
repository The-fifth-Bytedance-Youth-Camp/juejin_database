create table tag
(
	id           int auto_increment
		primary key,
	name         varchar(20)          not null,
	gmt_modified datetime             null on update CURRENT_TIMESTAMP,
	gmt_created  datetime             null,
	is_delete    tinyint(1) default 0 not null,
	constraint tag_name_uindex
		unique (name)
)
	collate = utf8_unicode_ci;

INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (1, '前端', '2023-01-25 17:06:25', '2023-01-25 17:06:27', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (2, '后端', '2023-01-25 17:06:47', '2023-01-25 17:06:45', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (3, 'JavaScript', '2023-01-25 17:07:15', '2023-01-25 17:07:12', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (4, '面试', '2023-01-25 17:07:31', '2023-01-25 17:07:29', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (5, 'GitHub', '2023-01-25 17:07:42', '2023-01-25 17:07:40', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (6, 'Vue.js', '2023-01-25 17:08:01', '2023-01-25 17:07:59', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (7, '架构', '2023-01-25 17:08:11', '2023-01-25 17:08:09', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (8, '算法', '2023-01-25 17:08:38', '2023-01-25 17:08:36', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (9, 'Java', '2023-01-25 17:08:42', '2023-01-25 17:08:40', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (10, 'CSS', '2023-01-25 17:08:54', '2023-01-25 17:08:53', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (11, '代码规范', '2023-01-25 17:09:10', '2023-01-25 17:09:08', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (12, 'Node.js', '2023-01-25 17:09:32', '2023-01-25 17:09:30', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (13, '数据库', '2023-01-25 17:09:53', '2023-01-25 17:09:51', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (14, 'MySQL', '2023-01-25 17:10:04', '2023-01-25 17:10:02', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (15, 'React.js', '2023-01-25 17:10:23', '2023-01-25 17:10:21', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (16, 'Linux', '2023-01-25 17:10:37', '2023-01-25 17:10:35', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (17, 'Git', '2023-01-25 17:10:46', '2023-01-25 17:10:45', 0);
INSERT INTO juejin_post.tag (id, name, gmt_modified, gmt_created, is_delete) VALUES (18, '正则表达式', '2023-01-25 17:11:15', '2023-01-25 17:11:13', 0);