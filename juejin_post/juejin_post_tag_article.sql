create table tag_article
(
	id           int auto_increment
		primary key,
	article_id   int                  not null,
	tag_id       int                  not null,
	gmt_modified datetime             null on update CURRENT_TIMESTAMP,
	gmt_created  datetime             null,
	is_delete    tinyint(1) default 0 not null,
	constraint haedhs
		foreign key (article_id) references article (id)
			on update cascade on delete cascade,
	constraint sagda
		foreign key (tag_id) references tag (id)
			on update cascade on delete cascade
)
	collate = utf8_unicode_ci;

INSERT INTO juejin_post.tag_article (id, article_id, tag_id, gmt_modified, gmt_created, is_delete) VALUES (1, 1, 1, '2023-01-25 17:12:04', '2023-01-25 17:12:00', 0);
INSERT INTO juejin_post.tag_article (id, article_id, tag_id, gmt_modified, gmt_created, is_delete) VALUES (2, 1, 3, '2023-01-25 17:12:06', '2023-01-25 17:12:02', 0);